import java.util.ArrayList;

public class Generator {

	CharSpace charSpace;
	
	public Generator() {
		charSpace = new CharSpace();
	}

	public boolean validCharsCheck(boolean checkbox1, boolean checkbox2, boolean checkbox3) {
		if (checkbox1 || checkbox2 || checkbox3)
			return true;
		else
			return false;
	}
	
	public boolean validLengthCheck(int minLength, int maxLength) {
		if (minLength <= 0 || maxLength <= 0) {
			return false;
		}
		else if (minLength > maxLength) {
			return false;
		}
		else return true;
	}

	public String[] join2Arrays(String[] array1, String[] array2) {
		String[] joinedArray = new String[array1.length + array2.length];
		for (int i = 0; i < array1.length; i++) {
			joinedArray[i] = array1[i];
		}
		for (int i = array1.length; i < array1.length + array2.length; i++) {
			joinedArray[i] = array2[i - array1.length];
		}
		return joinedArray;
	}

	public void charSpaceArrays (boolean checkbox1, boolean checkbox2, boolean checkbox3) {
		String[] charSpaceArray = {""};
		if (checkbox1 && checkbox2 && checkbox3) {
			charSpaceArray = charSpace.possibleChars;
		}
		else if (checkbox1 && checkbox2) {
			charSpaceArray = join2Arrays(charSpace.possibleCharsArr[0], charSpace.possibleCharsArr[1]);
		}
		else if (checkbox1 && checkbox3) {
			charSpaceArray = join2Arrays(charSpace.possibleCharsArr[0], charSpace.possibleCharsArr[2]);
		}
		else if (checkbox2 && checkbox3) {
			charSpaceArray = join2Arrays(charSpace.possibleCharsArr[1], charSpace.possibleCharsArr[2]);
		}
		else if (checkbox1) {
			charSpaceArray = charSpace.possibleCharsArr[0];
		}
		else if (checkbox2) {
			charSpaceArray = charSpace.possibleCharsArr[1];
		}
		else if (checkbox3) {
			charSpaceArray = charSpace.possibleCharsArr[2];
		}
		editCharSpace(charSpaceArray);
	}
	
	public void editCharSpace (String[] chars) {
		charSpace.setCharSpace(chars);
	}

	public String generateRandomPassword(int minLength, int maxLength, String[] chars) {
		ArrayList<String> passwords = new ArrayList<String>();
		for (int i = minLength; i <= maxLength; i++) {
			String password = "";
			for (int j = 0; j < i; j++) {
				int r = (int) (Math.random() * chars.length);
				password = password + chars[r];
			}
			passwords.add(password);
		}
		return passwords.toString();
	}
}