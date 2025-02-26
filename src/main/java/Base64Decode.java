import java.util.Base64;

public class Base64Decode {

    public static void main(String[] args) {
        Base64.Decoder decoder = Base64.getDecoder();
        System.out.println(new String(decoder.decode(args[0])));
    }
}
