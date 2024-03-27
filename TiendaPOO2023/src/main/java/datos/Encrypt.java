package datos;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import static java.lang.System.in;
import static java.lang.System.out;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Encrypt {

    private static List<String> variables;
    public static void main(String[] args) throws Exception{
                        
                File f = new File("src/java/procesos/config.properties");                
                variables = new ArrayList<>();
                variables.add("Usr");
                variables.add("Pass");
                variables.add("Server");
                variables.add("Port");
                variables.add("DB");
                out.println(f.getPath());
                Iterator e = variables.iterator();
		EncryptedProperties ep = new EncryptedProperties("AbCdEfGhIj");
		try {
			if (f.exists()) {
				FileInputStream in = new FileInputStream(f);
				ep.load(in);
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(in));
                        String key;
                        String value;
			while (e.hasNext()) {
                                key = e.next().toString();
				out.print(key+ ": ");
				value = br.readLine();
                                ep.setProperty(key, value);
                        }
                    try (FileOutputStream out = new FileOutputStream(f)) {
                        ep.store(out, "Archivo propiedades encriptado");
                    }

			out.println("Datos");
			Iterator i = ep.keySet().iterator();
			while (i.hasNext()) {
				String k = (String) i.next();
				String v = (String) ep.get(k);
				out.println("   " + k + "=" + v);
			}
		}
		catch (Exception er) {
			out.println("No se puede acceder al archivo encriptado: " + f.getAbsolutePath());
		}
    }
}
