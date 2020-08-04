import java.io.File;

public class Dir {

	public static void main(String[] args) {
		File aFile = null;
		aFile = new File(args[0]);
		if (aFile.isDirectory()) {
			String[] fileList = aFile.list();
			for (int i = 0; i < fileList.length; i++) {
				if (aFile.listFiles()[i].isDirectory()) {
					System.out.println("<DIR> " + fileList[i]);
				} else {
					System.out.println("<File> " + fileList[i]);
				}
			}
		} else {
			System.out.println("Couldn't find specified directory");
		}
	}

}
