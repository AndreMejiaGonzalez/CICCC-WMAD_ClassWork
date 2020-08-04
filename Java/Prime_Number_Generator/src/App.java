import com.opencsv.*;
import java.io.*;
import java.util.*;

public class App {
	static Generator gen = new Generator();
	static Scanner input = new Scanner(System.in);
	
	public static void main(String args[]) {
		File file = new File("Prime Numbers.csv");
		System.out.println("Prime Number Generator.");
		System.out.println("How many numbers should be created?");
		int length = input.nextInt();
		System.out.println("Input the maximum number.");
		int maxNumber = input.nextInt();
		input.close();
		int[] numberList = gen.createArray(length, maxNumber);
		System.out.println("Generated " + length + " prime numbers");
		System.out.println(Arrays.toString(numberList));
		try {
			FileWriter outputFile = new FileWriter(file);
			CSVWriter writer = new CSVWriter(outputFile);
			String[] header = {"Numbers"};
			String[][] data = new String[numberList.length][1];
			writer.writeNext(header);
			for(int i = 0; i < numberList.length; i++) {
				data[i][0] = String.valueOf(numberList[i]);
				writer.writeNext(data[i]);
			}
			writer.close();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("Generated numbers saved to " + file.getPath());
	}
}
