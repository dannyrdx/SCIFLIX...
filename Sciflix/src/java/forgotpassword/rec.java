package forgotpassword;


import java.util.Properties;
import javax.mail.*;  

import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;

public class rec{
      public static void SendingEmail(String Email,String Body) throws MessagingException
    {

             String host ="smtp.gmail.com";
             String from ="sciflixsu@gmail.com";  //Your mail id
             String pass ="sciflixadmin123";   // Your Password
             Properties props = System.getProperties();
             props.put("mail.smtp.starttls.enable", "true");
             props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
             props.put("mail.smtp.host", host);
             props.put("mail.smtp.user", from);
             props.put("mail.smtp.password", pass);
             props.put("mail.smtp.port", "25");
             props.put("mail.smtp.auth", "true");
             String[] to = {Email}; // To Email address
             Session session = Session.getDefaultInstance(props, null);
             MimeMessage message = new MimeMessage(session);
             message.setFrom(new InternetAddress(from));
             InternetAddress[] toAddress = new InternetAddress[to.length];        
             // To get the array of addresses
              for( int i=0; i < to.length; i++ )
              { // changed from a while loop
                  toAddress[i] = new InternetAddress(to[i]);
              }
             System.out.println(Message.RecipientType.TO);
             for( int j=0; j < toAddress.length; j++)
             { // changed from a while loop
             message.addRecipient(Message.RecipientType.TO, toAddress[j]);
             }
             message.setSubject("Email from SciArchives");

             message.setContent(Body,"text/html");
             Transport transport = session.getTransport("smtp");
             transport.connect(host, from, pass);
             transport.sendMessage(message, message.getAllRecipients());
                 transport.close();
        }
    
}
