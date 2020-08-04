
public class Generator {

	public int randomNumberGenerator(int maxNumber) {
		int generatedNumber = (int) Math.floor(Math.random() * maxNumber+1);
		return generatedNumber;
	}

	public boolean primeChecker(int generatedNumber) {
		boolean boolFlag = false;
		if (generatedNumber == 2) {
			boolFlag = true;
		} else if (generatedNumber > 1) {
			for (int i = 2; i < generatedNumber; i++) {
				if (generatedNumber % i != 0) {
					boolFlag = true;
				} else {
					boolFlag = false;
					break;
				}
			}
		} else {
			boolFlag = false;
		}
		return boolFlag;
	}
	
	public int[] createArray(int length, int maxNumber) {
		int[] numberList = new int[length];
		int counter = 0;
		while (counter < length) {
			int generatedNumber = randomNumberGenerator(maxNumber);
			if (primeChecker(generatedNumber)) {
				numberList[counter] = generatedNumber;
				counter++;
			}
		}
		return numberList;
	}
}
