package com.posh.utils;

import jakarta.mail.*;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.util.Date;
import java.util.Properties;

public class EmailUtility {
    public static boolean sendEmail(String body) throws AddressException, MessagingException {
        String to = "karimtaha881@gmail.com"; //Recipient's email address
        String from = "poshspareparts@gmail.com"; //Sender's email address
        String host = "smtp.gmail.com"; //SMTP server's hostname
        String password = "aykcdlzamsatwcab";
        int port = 587; //SMTP server's port

        Properties properties = new Properties();
        properties.put("mail.smtp.host", host); // SMTP Host
        properties.put("mail.smtp.port", port); // TLS Port
        properties.put("mail.smtp.auth", true); // enable authentication
        properties.put("mail.smtp.starttls.enable", true);
        properties.put("mail.smtp.ssl.trust", host);

        Authenticator authenticator = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        };

        Session session = Session.getInstance(properties, authenticator);
        System.out.println("session-> " + session);

        try {
            MimeMessage message = new MimeMessage(session);
            message.addHeader("Content-type", "text/HTML; charset=UTF-8");
            message.addHeader("format", "flowed");
            message.addHeader("Content-Transfer-Encoding", "8bit");
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Reset Password", "UTF-8");
            message.setText(body, "UTF-8");
            message.setSentDate(new Date());
            System.out.println("Message Ready");
            message.saveChanges();

            Transport.send(message);
            System.out.println("Email sent successfully");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }

    }
}
