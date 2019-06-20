package forgotpassword;

import com.sun.mail.smtp.SMTPMessage;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.InternetAddress;


public class VerificationMail {
    
     public static void main(String args[]) {   
    
    Properties properties = new Properties();
     properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
    
    Session session = Session.getInstance(properties,new javax.mail.Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("sciflixsu@gmail.com","sciflixadmin07");
        }
    });

    try {
        
        SMTPMessage message = new SMTPMessage(session);
        message.setFrom(new InternetAddress("sciflixsu@gmail.com"));
        message.setRecipients(Message.RecipientType.TO,
                                 InternetAddress.parse("fahadmomin46ss@gmail.com"));

        message.setSubject("Verification Mail");
        message.setText("Welcome to Sciflix!!");
        message.setNotifyOptions(SMTPMessage.NOTIFY_SUCCESS);
        int returnOption = message.getReturnOption();
        System.out.println(returnOption);        
        Transport.send(message);
        System.out.println("sent");

    }
     catch (MessagingException e) {
     }
   }
}