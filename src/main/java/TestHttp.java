import java.net.*;

/**
 * Really for testing https connections, to validate certificate trust.
 * <p><code>
 * java -Djavax.net.ssl.trustStore=/config/trust.jks -Djavax.net.ssl.keyStorePassword=$TRUST_PASSWORD TestHttp https://example.com
 * </code><p>
 */
public class TestHttp {

    public static void main(String[] args) throws Exception {
        HttpURLConnection con = (HttpURLConnection) new URL(args[0]).openConnection();
        con.setRequestMethod("GET");
        con.getInputStream();
    }
}