package Pieces;

public class Queen extends Piece {
	/*
	 * every piece has a constructor, when the object is created it's given a color,
	 * and an x,y position
	 */
	public Queen(int x, int y, String color) {
		this.color = color;
		this.xPos = x;
		this.yPos = y;
		if (this.color.equals("white")) {
			this.name = ("[WhQn]");
		} else {
			this.name = ("[BlQn]");
		}
	}

	/*
	 * move works by creating a new queen in the location specified by x and y and
	 * changing the previous one to a default piece
	 */
	@Override
	public void move(Piece[][] aBoard, int x, int y) {
		/*
		 * first it checks if the place it's trying to move to is empty and if the move
		 * is valid
		 */
		if (aBoard[x][y].isEmpty() && isValid(aBoard, x, y)) {
			// if everything is correct it creates the queen
			aBoard[x][y] = new Queen(x, y, this.color);
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
			aBoard[x][y] = new Queen(x, y, this.color);
			aBoard[this.xPos][this.yPos] = new Piece();
		} else {
			// otherwise it displays this messages
			System.out.println("Invalid move");
		}
	}

	/*
	 * the queen's isValid method simply checks the conditions of the rook's isValid
	 * method and the bishop's isValid method since the queen has the movement of
	 * both
	 */
	@Override
	public boolean isValid(Piece[][] aBoard, int x, int y) {
		int difX = Math.abs(this.xPos - x);
		int difY = Math.abs(this.yPos - y);
		if (x == this.xPos || y == this.yPos) {
			return true;
		} else if (difX == difY) {
			return true;
		} else
			return false;
	}

	/*
	 * the queen's isBlocked method simply checks the conditions of the rook's
	 * isBlocked method and the bishop's isBlocked method since the queen has the
	 * movement of both
	 */
	public boolean isBlocked(Piece[][] aBoard, int x, int y) {
		boolean flag = false;
		if (this.xPos == x) {
			if (y > this.yPos) {
				for (int i = this.yPos + 1; i < y; i++) {
					if (aBoard[x][i].isEmpty() == false) {
						flag = true;
					}
				}
			} else if (y < this.yPos) {
				for (int i = this.yPos - 1; i > y; i--) {
					if (aBoard[x][i].isEmpty() == false) {
						flag = true;
					}
				}
			}
		} else if (this.yPos == y) {
			if (x > this.xPos) {
				for (int i = this.xPos + 1; i < x; i++) {
					if (aBoard[i][y].isEmpty() == false) {
						flag = true;
					}
				}
			} else if (x < this.xPos) {
				for (int i = this.xPos - 1; i > x; i--) {
					if (aBoard[i][y].isEmpty() == false) {
						flag = true;
					}
				}
			}
		} else if (x > this.xPos && y > this.yPos) {
			for (int i = this.xPos + 1, j = this.yPos + 1; i < x && j < y; i++, j++) {
				if (aBoard[i][j].isEmpty() == false) {
					flag = true;
				}
			}
		} else if (x > this.xPos && y < this.yPos) {
			for (int i = this.xPos + 1, j = this.yPos - 1; i < x && j > y; i++, j--) {
				if (aBoard[i][j].isEmpty() == false) {
					flag = true;
				}
			}
		} else if (x < this.xPos && y < this.yPos) {
			for (int i = this.xPos - 1, j = this.yPos - 1; i > x && j > y; i--, j--) {
				if (aBoard[i][j].isEmpty() == false) {
					flag = true;
				}
			}
		} else if (x < this.xPos && y > this.yPos) {
			for (int i = this.xPos - 1, j = this.yPos + 1; i > x && j < y; i--, j++) {
				if (aBoard[i][j].isEmpty() == false) {
					flag = true;
				}
			}
		}
		return flag;
	}
}
