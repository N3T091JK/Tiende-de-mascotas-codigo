 package entidades;

import static java.lang.Integer.toHexString;
import java.security.MessageDigest;
import static java.security.MessageDigest.getInstance;
import java.security.NoSuchAlgorithmException;

public abstract class Entidad {
    public static String id;
    public boolean AUTO_INCREMENT=false;
    public String PRIMARY_KEY="id";
                  
    public static String getHash(String message) throws NoSuchAlgorithmException {
        MessageDigest md;
        byte[] buffer, digest; 
        String hash = "";
        buffer = message.getBytes();
        md = getInstance("SHA1");
        md.update(buffer);
        digest = md.digest();

        for(byte aux : digest) {
            int b = aux & 0xff;
            if (toHexString(b).length() == 1) hash += "0";
            hash += toHexString(b);
        }
     return hash;}
}
