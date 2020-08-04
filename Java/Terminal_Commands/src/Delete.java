import java.io.File;

public class Delete {

	public static void main(String[] args) {
		File aFile = null;
		aFile = new File(args[0]);
		if (aFile.delete()) {
			System.out.println("File:" + aFile.getPath() + " was succesfully deleted");
		} else {
			System.out.println("File:" + aFile.getPath() + " could not be deleted");
		}
	}
}
