import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Copy {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FileReader aReader = null;
		FileWriter aWriter = null;
		try {
			aReader = new FileReader(args[0]);
			aWriter = new FileWriter(args[1]);
			int c = 0;
			do {
				aWriter.write(c);
			} while ((c = aReader.read()) != -1);
			aWriter.close();
			aReader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("File:" + args[0] + " copied to File:" + args[1]);
	}

}
