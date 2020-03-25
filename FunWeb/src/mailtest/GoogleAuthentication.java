package mailtest;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
        passAuth = new PasswordAuthentication("jinixdev", "jxjvccsgghvemzdq");
//        jxjvccsgghvemzdq
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}
