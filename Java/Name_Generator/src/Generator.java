import java.io.*;
import java.util.*;

public class Generator {
	
	public ArrayList<String> nameArray() {
		File file = new File("first_names.all.txt"); 
		  
		  BufferedReader br;
		  ArrayList<String> names = new ArrayList<String>();
		try {
			br = new BufferedReader(new FileReader(file));
			String line;
			try {
				while ((line = br.readLine()) != null) {
				    names.add(line);
				}
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return names;
	}
	
	public ArrayList<String> lastNameArray() {
		File file = new File("last_names.all.txt"); 
		  
		  BufferedReader br;
		  ArrayList<String> lastNames = new ArrayList<String>();
		try {
			br = new BufferedReader(new FileReader(file));
			String line;
			try {
				while ((line = br.readLine()) != null) {
				    lastNames.add(line);
				}
				br.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lastNames;
	}
	
	public String[][] nameGenerator(ArrayList<String> names, ArrayList<String> lastNames, int length) {
		String[][] fullNames = new String[length][2];
		for(int i = 0; i < length; i++) {
			int rnd1 = (int) Math.floor(Math.random()*names.size()+1);
			int rnd2 = (int) Math.floor(Math.random()*lastNames.size()+1);
			fullNames[i][0] = names.get(rnd1);
			fullNames[i][1] = lastNames.get(rnd2);
		}
		return fullNames;
	}
}