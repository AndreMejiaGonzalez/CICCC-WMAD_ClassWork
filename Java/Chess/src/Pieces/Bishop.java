package Pieces;

public class Bishop extends Piece {
	/*
	 * every piece has a constructor, when the object is created it's given a color,
	 * and an x,y position
	 */
	public Bishop(int x, int y, String color) {
		this.color = color;
		this.xPos = x;
		this.yPos = y;
		if (this.color.equals("white")) {
			this.name = ("[WhBp]");
		} else {
			this.name = ("[BlBp]");
		}
	}

	/*
	 * move works by creating a new bishop in the location specified by x and y and
	 * changing the previous one to a default piece
	 */
	@Override
	public void move(Piece[][] aBoard, int x, int y) {
		/*
		 * first it checks if the place it's trying to move to is empty and if the move
		 * is valid
		 */
		if (aBoard[x][y].isEmpty() && isValid(aBoard, x, y)) {
			// if everything is correct it creates the bishop
			aBoard[x][y] = new Bishop(x, y, this.color);
			aBoard[this.xPos][this.yPos] = new Piece();
		} else {
			// otherwise it displays this messages
			System.out.println("Invalid move");
		}
	}

	/*
	 * eat works by changing the piece to be eaten to one of the same type as the
	 * piece calling the method and changing the previous one to a default piece
	 */
	@Override
	public void eat(Piece[][] aBoard, int x, int y) {
		/*
		 * first it checks if the piece it's trying to eat is of the same color and if
		 * the move is valid
		 */
		if (isValid(aBoard, x, y) && this.color.equals(aBoard[x][y].color) == false) {
			// if everything is correct it changes the piece to a bishop
			aBoard[x][y] = new Bishop(x, y, this.color);
			aBoard[this.xPos][this.yPos] = new Piece();
		} else {
			// otherwise it displays this message
			System.out.println("Invalid move");
		}
	}

	/*
	 * the isValid method for the bishop works by checking the difference between
	 * the current x,y position and the target x,y position, this is because the x
	 * and y position of a piece would have to increase or decrease by the same
	 * amount for the movement to be diagonal
	 */
	@Override
	public boolean isValid(Piece[][] aBoard, int x, int y) {
		// first it calls isBlocked, if it returns false it continues
		if (isBlocked(aBoard, x, y) == false) {
			/*
			 * then it creates difX and difY and it gives them the absolute value of the
			 * difference between current x and target x and current y and target y
			 * respectively
			 */
			int difX = Math.abs(this.xPos - x);
			int difY = Math.abs(this.yPos - y);
			// if difX and difY are equal than the move is diagonal an thus valid
			if (difX == difY) {
				return true;
				// otherwise it return true
			} else
				return false;
			// if isBlocked returns true then it will return false
		} else
			return false;
	}

	/*
	 * the isBlocked method for bishop checks the x,y position of the place the
	 * bishop is trying to move to, with this it determines the direction of the
	 * movement depending on the value of the target x,y position
	 */
	public boolean isBlocked(Piece[][] aBoard, int x, int y) {
		boolean flag = false;
		/*
		 * if target x and y are both higher than current x and y it would mean they are
		 * both increasing meaning the movement is going diagonally down and to the
		 * right
		 */
		if (x > this.xPos && y > this.yPos) {
			/*
			 * then it loops through every space between the current x,y position and the
			 * target x,y position
			 */
			for (int i = this.xPos + 1, j = this.yPos + 1; i < x && j < y; i++, j++) {
				// if any space isn't empty then the piece is blocked from moving
				if (aBoard[i][j].isEmpty() == false) {
					flag = true;
				}
			}
			/*
			 * if target x is higher than current x and y is lower it would mean x is
			 * increasing and y is decreasing meaning the movement is going diagonally down
			 * and to the left
			 */
		} else if (x > this.xPos && y < this.yPos) {
			/*
			 * then it loops through every space between the current x,y position and the
			 * target x,y position
			 */
			for (int i = this.xPos + 1, j = this.yPos - 1; i < x && j > y; i++, j--) {
				if (aBoard[i][j].isEmpty() == false) {
					// if any space isn't empty then the piece is blocked from moving
					flag = true;
				}
			}
			/*
			 * if target x and y are both lower than current x and y it would mean they are
			 * both decreasing meaning the movement is going diagonally up and to the left
			 */
		} else if (x < this.xPos && y < this.yPos) {
			/*
			 * then it loops through every space between the current x,y position and the
			 * target x,y position
			 */
			for (int i = this.xPos - 1, j = this.yPos - 1; i > x && j > y; i--, j--) {
				if (aBoard[i][j].isEmpty() == false) {
					// if any space isn't empty then the piece is blocked from moving
					flag = true;
				}
			}
			/*
			 * if target x is lower than current x and y is higher it would mean x is
			 * decreasing and y is increasing meaning the movement is going diagonally up
			 * and to the right
			 */
		} else if (x < this.xPos && y > this.yPos) {
			/*
			 * then it loops through every space between the current x,y position and the
			 * target x,y position
			 */
			for (int i = this.xPos - 1, j = this.yPos + 1; i > x && j < y; i--, j++) {
				if (aBoard[i][j].isEmpty() == false) {
					// if any space isn't empty then the piece is blocked from moving
					flag = true;
				}
			}
		}
		return flag;
	}
}
