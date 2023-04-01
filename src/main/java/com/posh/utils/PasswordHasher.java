package com.posh.utils;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.function.Function;

public class PasswordHasher {
    private static final Logger log = LoggerFactory.getLogger(PasswordHasher.class);

    private static PasswordHasher instance;
    private final int logRounds;

    private PasswordHasher(int logRounds) {
        this.logRounds = logRounds;
    }

    public static PasswordHasher getInstance(int logRounds) {
        if (instance == null) {
            synchronized (PasswordHasher.class) {
                if (instance == null) {
                    instance = new PasswordHasher(logRounds);
                }
            }
        }
        return instance;
    }

    public String hash(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(logRounds));
    }

    public boolean verifyHash(String password, String hash) {
        return BCrypt.checkpw(password, hash);
    }

    public boolean verifyAndUpdateHash(String password, String hash, Function<String, Boolean> updateFunc) {
        if (!BCrypt.checkpw(password, hash)) {
            return false;
        }

        int rounds = getRounds(hash);
        if (rounds == logRounds) {
            return true;
        }

        log.debug("Updating password from {} rounds to {}", rounds, logRounds);
        String newHash = hash(password);
        return updateFunc.apply(newHash);
    }

    private static int getRounds(String salt) {
        char minor = (char) 0;
        int off = 0;

        if (salt.charAt(0) != '$' || salt.charAt(1) != '2')
            throw new IllegalArgumentException("Invalid salt version");
        if (salt.charAt(2) == '$')
            off = 3;
        else {
            minor = salt.charAt(2);
            if (minor != 'a' || salt.charAt(3) != '$')
                throw new IllegalArgumentException("Invalid salt revision");
            off = 4;
        }

        if (salt.charAt(off + 2) > '$')
            throw new IllegalArgumentException("Missing salt rounds");
        return Integer.parseInt(salt.substring(off, off + 2));
    }
}
