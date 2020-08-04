import java.io.File;

public class MkDir {

	public static void main(String[] args) {
		File aFile = null;
		aFile = new File(args[0]);
		if (aFile.mkdir()) {
			System.out.println("Dir: " + aFile.getPath() + " was succesfully created");
		} else {
			System.out.println("Dir: " + aFile.getPath() + " could not be created");
		}
	}
}
