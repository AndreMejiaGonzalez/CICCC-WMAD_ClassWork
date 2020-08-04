package Pieces;

public class Rook extends Piece {
	/*
	 * every piece has a constructor, when the object is created it's given a color,
	 * and an x,y position, pawns, rooks, and kings are the only ones that need to
	 * initialize the movedFlag since they are the only ones with alternate moves in
	 * that condition, when these pieces do a move they create a new piece with a
	 * movedFlag set to true
	 */
	public Rook(int x, int y, String color, boolean hasMoved) {
		this.color = color;
		this.xPos = x;
		this.yPos = y;
		this.movedFlag = hasMoved;
		if (this.color.equals("white")) {
			this.name = ("[WhRk]");
		} else {
			this.name = ("[BlRk]");
		}
	}

	/*
	 * move works by creating a new rook in the location specified by x and y and
	 * changing the previous one to a default piece
	 */
	@Override
	public void move(Piece[][] aBoard, int x, int y) {
		/*
		 * first it checks if the place it's trying to move to is empty and if the move
		 * is valid
		 */
		if (aBoard[x][y].isEmpty() && isValid(aBoard, x, y)) {
			// if everything is correct it creates the rook with a true movedFlag
			aBoard[x][y] = new Rook(x, y, this.color, true);
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
			// if everything is correct it changes the piece to a rook with a true movedFlag
			aBoard[x][y] = new Rook(x, y, this.color, true);
			aBoard[this.xPos][this.yPos] = new Piece();
		} else {
			// otherwise it displays this message
			System.out.println("Invalid move");
		}
	}

	/*
	 * the isValid method for rooks works simply by checking if the place is trying
	 * to move to is on either the same x or y position
	 */
	@Override
	public boolean isValid(Piece[][] aBoard, int x, int y) {
		// first it calls isBlocked, if it returns false it continues
		if (isBlocked(aBoard, x, y) == false) {
			/*
			 * if either x or y are equal to the current x or y than the move is vertical or
			 * horizontal
			 */
			if (x == this.xPos || y == this.yPos) {
				// if the move is vertical or horizontal it returns true
				return true;
			} else
				// otherwise it returns false
				return false;
			// if isBlocked returns true then it will return false
		} else
			return false;
	}

	/*
	 * the isBlocked method for rooks checks the x,y position of the place the rook
	 * is trying to move to, with this it determines if the move is horizontal or
	 * vertical and the direction of the movement depending on the difference
	 * between the rook's x,y position and the target x,y position
	 */
	public boolean isBlocked(Piece[][] aBoard, int x, int y) {
		boolean flag = false;
		/*
		 * if the target x position and the rook's x position are the same than the move
		 * is horizontal
		 */
		if (this.xPos == x) {
			/*
			 * if the move is horizontal and the target y position is higher than the rook's
			 * y position than the rook is moving to the right
			 */
			if (y > this.yPos) {
				/*
				 * then it loops through every space between the current x,y position and the
				 * target x,y position
				 */
				for (int i = this.yPos + 1; i < y; i++) {
					// if any space isn't empty then the piece is blocked from moving
					if (aBoard[x][i].isEmpty() == false) {
						flag = true;
					}
				}
				/*
				 * if the move is horizontal and the target y position is lower than the rook's
				 * y position than the rook is moving to the left
				 */
			} else if (y < this.yPos) {
				/*
				 * then it loops through every space between the current x,y position and the
				 * target x,y position
				 */
				for (int i = this.yPos - 1; i > y; i--) {
					// if any space isn't empty then the piece is blocked from moving
					if (aBoard[x][i].isEmpty() == false) {
						flag = true;
					}
				}
			}
			/*
			 * if the target y position and the rook's y position are the same than the move
			 * is vertical
			 */
		} else if (this.yPos == y) {
			/*
			 * if the move is vertical and the target x position is higher than the rook's x
			 * position than the rook is moving downwards
			 */
			if (x > this.xPos) {
				/*
				 * then it loops through every space between the current x,y position and the
				 * target x,y position
				 */
				for (int i = this.xPos + 1; i < x; i++) {
					// if any space isn't empty then the piece is blocked from moving
					if (aBoard[i][y].isEmpty() == false) {
						flag = true;
					}
				}
				/*
				 * if the move is vertical and the target x position is lower than the rook's x
				 * position than the rook is moving upwards
				 */
			} else if (x < this.xPos) {
				/*
				 * then it loops through every space between the current x,y position and the
				 * target x,y position
				 */
				for (int i = this.xPos - 1; i > x; i--) {
					// if any space isn't empty then the piece is blocked from moving
					if (aBoard[i][y].isEmpty() == false) {
						flag = true;
					}
				}
			}
		}
		return flag;
	}
}
