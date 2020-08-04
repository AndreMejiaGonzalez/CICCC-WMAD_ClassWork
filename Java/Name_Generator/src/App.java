import java.util.*;
import java.io.*;
import com.opencsv.*;

public class App {
	static Generator gen = new Generator();
	static Scanner input = new Scanner(System.in);
	
	public static void writeToCSV(File file, String[][] fullNames) {
		try {
			FileWriter outputFile = new FileWriter(file);
			CSVWriter writer = new CSVWriter(outputFile);
			String[] header = {"Name","Last Name"};
			writer.writeNext(header);
			for(int i = 0; i < fullNames.length; i++) {
				writer.writeNext(fullNames[i]);
			}
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		File file = new File("Names.csv");
		System.out.println("Name Generator");
		System.out.println("How many names should be generated?");
		
		int length = input.nextInt();
		
		String[][] fullNames = gen.nameGenerator(gen.nameArray(), gen.lastNameArray(), length);
		
		System.out.println("Generated " + length + " names.");
		System.out.println(Arrays.deepToString(fullNames));
		writeToCSV(file, fullNames);
		System.out.println("Names saved to " + file.getPath());
	}

}
