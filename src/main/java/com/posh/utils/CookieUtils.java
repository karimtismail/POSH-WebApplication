package com.posh.utils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Optional;
import java.util.stream.Stream;

public class CookieUtils {
    private static volatile CookieUtils instance = null;

    private CookieUtils() {
        if (instance != null)
            throw new RuntimeException("Use getInstance(), reflection is not allowed");
    }

    public static CookieUtils getInstance() {
        if (instance == null) {
            synchronized (CookieUtils.class) {
                if (instance == null) {
                    instance = new CookieUtils();
                }
            }
        }
        return instance;
    }

    public void addCookie(HttpServletResponse response, String name, String value) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(24 * 60 * 60);
        response.addCookie(cookie);
    }

    public Optional<Cookie> getCookie(Cookie[] cookies, String cookieName) {
        Optional<Cookie> optionalCookie = Optional.empty();
        if (cookies != null) {
            optionalCookie = Stream.of(cookies)
                    .filter((c) -> c.getName().equals(cookieName))
                    .findFirst();
        }
        return optionalCookie;
    }

    public void removeCookie(HttpServletResponse response, String name) {
        Cookie cookie = new Cookie(name, "");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }
}