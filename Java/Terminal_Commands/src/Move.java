import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Move {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		File aFile = null;
		FileReader aReader = null;
		FileWriter aWriter = null;
		try {
			aFile = new File(args[0]);
			aReader = new FileReader(aFile);
			aWriter = new FileWriter(args[1]);
			int c = 0;
			do {
				aWriter.write(c);
			} while ((c = aReader.read()) != -1);
			aFile.deleteOnExit();
			aWriter.close();
			aReader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("File:" + args[0] + " moved to File:" + args[1]);
	}

}
