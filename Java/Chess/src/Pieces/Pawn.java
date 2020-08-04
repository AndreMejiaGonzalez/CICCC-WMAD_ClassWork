package Pieces;

public class Pawn extends Piece {
	/*
	 * every piece has a constructor, when the object is created it's given a color,
	 * and an x,y position, pawns, rooks, and kings are the only ones that need to
	 * initialize the movedFlag since they are the only ones with alternate moves in
	 * that condition, when these pieces do a move they create a new piece with a
	 * movedFlag set to true
	 */
	public Pawn(int x, int y, String color, boolean hasMoved) {
		this.color = color;
		this.xPos = x;
		this.yPos = y;
		this.movedFlag = hasMoved;
		if (this.color.equals("white")) {
			this.name = "[WhPn]";
		} else {
			this.name = "[BlPn]";
		}
	}

	/*
	 * move works by creating a new pawn in the location specified by x and y and
	 * changing the previous one to a default piece
	 */
	@Override
	public void move(Piece[][] aBoard, int x, int y) {
		/*
		 * first it check if the place it's trying to move to is empty, if the move is
		 * valid and if the move is blocked by any piece, which in the case of pawn can
		 * only happen on the first move of the pawn
		 */
		if (aBoard[x][y].isEmpty() && isValid(aBoard, x, y, this.movedFlag) && isBlocked(aBoard) == false) {
			// if everything is correct it creates the pawn with a true movedFlag
			aBoard[x][y] = new Pawn(x, y, this.color, true);
			aBoard[this.xPos][this.yPos] = new Piece();
		} else {
			// otherwise it displays this message
			System.out.println("Invalid move");
		}
	}

	/*
	 * eat works by changing the piece to be eaten to one of the same type as the
	 * piece calling the method and changing the previous one to a default piece,
	 * for pawn specifically it has to utilize the method isValidEat
	 */
	@Override
	public void eat(Piece[][] aBoard, int x, int y) {
		/*
		 * first it checks if the piece it's trying to eat is of the same color and if
		 * the move is valid
		 */
		if (isValidEat(aBoard, x, y) && this.color.equals(aBoard[x][y].color) == false) {
			// if everything is correct it changes the piece to a pawn with a true movedFlag
			aBoard[x][y] = new Pawn(x, y, this.color, true);
			aBoard[this.xPos][this.yPos] = new Piece();
		} else {
			// otherwise it displays this message
			System.out.println("Invalid move");
		}
	}

	/*
	 * the isValid method for pawns works differently depending on the piece's color
	 * and if the piece has moved, isValid works by checking the space the piece is
	 * trying to move by checking the piece at the position of the specified x,y
	 * positions and confirming if is valid for that piece
	 */
	public boolean isValid(Piece[][] aBoard, int x, int y, boolean hasMoved) {
		// first it checks if the piece has moved
		if (hasMoved == false) {
			// if it has moved it moves on to checking its color
			if (this.color.equals("white")) {
				/*
				 * a white pawn that hasn't moved should move one or two spaces above, otherwise
				 * the move is invalid
				 */
				if ((x == this.xPos - 1 || x == this.xPos - 2) && y == this.yPos) {
					return true;
				} else
					return false;
			} else {
				/*
				 * a black pawn that hasn't moved should move one or two spaces below, otherwise
				 * the move is invalid
				 */
				if ((x == this.xPos + 1 || x == this.xPos + 2) && y == this.yPos) {
					return true;
				} else
					return false;
			}
		} else {
			if (this.color.equals("white")) {
				/*
				 * a white pawn that has moved should move one space above, otherwise the move
				 * is invalid
				 */
				if (x == this.xPos - 1 && y == this.yPos) {
					return true;
				} else
					return false;
			} else {
				/*
				 * a black pawn that has moved should move one space below, otherwise the move
				 * is invalid
				 */
				if (x == this.xPos + 1 && y == this.yPos) {
					return true;
				} else
					return false;
			}
		}
	}

	/*
	 * isValidEat works basically the same as isValid but it checks for a different
	 * movement, pawn is the only piece that needs this method
	 */
	public boolean isValidEat(Piece[][] aBoard, int x, int y) {
		if (this.color.equals("white")) {
			/*
			 * if the pawn is white it can only eat diagonally up to the left or right,
			 * otherwise the move is invalid
			 */
			if (x == this.xPos - 1 && (y == this.yPos + 1 || y == this.yPos - 1)) {
				return true;
			} else
				return false;

		} else {
			/*
			 * if the pawn is black it can only eat diagonally down to the left or right,
			 * otherwise the move is invalid
			 */
			if (x == this.xPos + 1 && (y == this.yPos + 1 || y == this.yPos - 1)) {
				return true;
			} else
				return false;
		}
	}

	/*
	 * promote works by creating a new piece of the chosen type where the pawn to be
	 * promoted used to be
	 */
	public void promote(Piece[][] aBoard, int choice) {
		// promote uses the method canPromote to check if the promotion is valid
		if (canPromote()) {
			// if canPromote is true then it checks the choice parameter
			switch (choice) {
			case 0:
				// if choice is 0 it changes the pawn to a rook
				aBoard[this.xPos][this.yPos] = new Rook(this.xPos, this.yPos, this.color, true);
			case 1:
				// if choice is 1 it changes the pawn to a knight
				aBoard[this.xPos][this.yPos] = new Knight(this.xPos, this.yPos, this.color);
			case 2:
				// if choice is 2 it changes the pawn to a bishop
				aBoard[this.xPos][this.yPos] = new Bishop(this.xPos, this.yPos, this.color);
			case 3:
				// if choice is 3 it changes the pawn to a queen
				aBoard[this.xPos][this.yPos] = new Queen(this.xPos, this.yPos, this.color);
			}
		}
	}

	// canPromote simply checks if the pawn in question is in place
	public boolean canPromote() {
		// if a white pawn reaches the top row it can promote otherwise it can't
		if (this.color.equals("white") && this.xPos == 0) {
			return true;
			// if a black pawn reaches the bottom row it can promote otherwise it can't
		} else if (this.color.equals("black") && this.xPos == 7) {
			return true;
		} else
			return false;
	}

	/*
	 * the isBlocked method for pawns checks if a pawn has moved and the space in
	 * front of it since the only way a pawn can be blocked is if it's trying to
	 * move 2 space in its first move and has a piece in front of it
	 */
	public boolean isBlocked(Piece[][] aBoard) {
		if (this.movedFlag) {
			// if the pawn has moved it can't be blocked so it returns false
			return false;
		} else {
			// if the pawn hasn't moved then it checks its color
			if (this.color.equals("white")) {
				// for a white pawn if the space above is empty then it isn't blocked
				if (aBoard[this.xPos - 1][this.yPos].isEmpty()) {
					return false;
				} else
					// otherwise it is blocked
					return true;
			} else {
				// for a black pawn if the space below is empty then it isn't blocked
				if (aBoard[this.xPos + 1][this.yPos].isEmpty()) {
					return false;
				} else
					// otherwise it is blocked
					return true;
			}
		}
	}
}
