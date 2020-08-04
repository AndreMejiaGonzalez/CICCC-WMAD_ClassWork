package Pieces;

public class Knight extends Piece {
	/*
	 * every piece has a constructor, when the object is created it's given a color,
	 * and an x,y position
	 */
	public Knight(int x, int y, String color) {
		this.color = color;
		this.xPos = x;
		this.yPos = y;
		if (this.color.equals("white")) {
			this.name = ("[WhKn]");
		} else {
			this.name = ("[BlKn]");
		}
	}

	/*
	 * move works by creating a new knight in the location specified by x and y and
	 * changing the previous one to a default piece
	 */
	@Override
	public void move(Piece[][] aBoard, int x, int y) {
		/*
		 * first it checks if the place it's trying to move to is empty and if the move
		 * is valid, knight doesn't check if the piece is blocked since it can "jump"
		 * over any piece
		 */
		if (aBoard[x][y].isEmpty() && isValid(aBoard, x, y)) {
			// if everything is correct it creates the knight
			aBoard[x][y] = new Knight(x, y, this.color);
			aBoard[this.xPos][this.yPos] = new Piece();
		} else {
			// otherwise it displays this message
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
			// if everything is correct it changes the piece to a knight
			aBoard[x][y] = new Knight(x, y, this.color);
			aBoard[this.xPos][this.yPos] = new Piece();
		} else {
			// otherwise it displays this message
			System.out.println("Invalid move");
		}
	}

	/*
	 * the isValid method for knights simply checks if the piece is trying to move
	 * to one of eight spaces since a knight only has eight possible moves at any
	 * point in time
	 */
	@Override
	public boolean isValid(Piece[][] aBoard, int x, int y) {
		/*
		 * if the knight tries to move to any of the specified spaces the method returns
		 * true
		 */
		if ((x == this.xPos - 2 && y == this.yPos - 1) || (x == this.xPos - 2 && y == this.yPos + 1)
				|| (x == this.xPos - 1 && y == this.yPos - 2) || (x == this.xPos - 1 && y == this.yPos + 2)
				|| (x == this.xPos + 1 && y == this.yPos - 2) || (x == this.xPos + 1 && y == this.yPos + 2)
				|| (x == this.xPos + 2 && y == this.yPos - 1) || (x == this.xPos + 2 && y == this.yPos + 1)) {
			return true;
			// otherwise it returns false
		} else
			return false;
	}
}
