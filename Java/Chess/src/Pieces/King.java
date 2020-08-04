package Pieces;

public class King extends Piece {
	/*
	 * every piece has a constructor, when the object is created it's given a color,
	 * and an x,y position, pawns, rooks, and kings are the only ones that need to
	 * initialize the movedFlag since they are the only ones with alternate moves in
	 * that condition, when these pieces do a move they create a new piece with a
	 * movedFlag set to true
	 */
	public King(int x, int y, String color, boolean hasMoved) {
		this.color = color;
		this.xPos = x;
		this.yPos = y;
		this.movedFlag = hasMoved;
		if (this.color.equals("white")) {
			this.name = ("[WhKg]");
		} else {
			this.name = ("[BlKg]");
		}
	}

	/*
	 * move works by creating a new king in the location specified by x and y and
	 * changing the previous one to a default piece
	 */
	@Override
	public void move(Piece[][] aBoard, int x, int y) {
		/*
		 * first it checks if the place it's trying to move to is empty and if the move
		 * is valid
		 */
		if (aBoard[x][y].isEmpty() && isValid(aBoard, x, y)) {
			// if everything is correct it creates the king with a true movedFlag
			aBoard[x][y] = new King(x, y, this.color, true);
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
		if (isValid(aBoard, x, y) && this.color.equals(aBoard[x][y].color) == false) {
			// if everything is correct it changes the piece to a king with a true movedFlag
			aBoard[x][y] = new King(x, y, this.color, true);
			aBoard[this.xPos][this.yPos] = new Piece();
		} else {
			// otherwise it displays this message
			System.out.println("Invalid move");
		}
	}

	/*
	 * the isValid method for king simply checks if the piece is trying to move to
	 * one of eight spaces since a king only has eight possible moves at any point
	 * in time
	 */
	@Override
	public boolean isValid(Piece[][] aBoard, int x, int y) {
		/*
		 * if the king tries to move to any of the specified spaces the method returns
		 * true
		 */
		if ((x == this.xPos - 1 && y == this.yPos - 1) || (x == this.xPos - 1 && y == this.yPos)
				|| (x == this.xPos - 1 && y == this.yPos + 1) || (x == this.xPos && y == this.yPos - 1)
				|| (x == this.xPos && y == this.yPos + 1) || (x == this.xPos + 1 && y == this.yPos - 1)
				|| (x == this.xPos + 1 && y == this.yPos) || (x == this.xPos + 1 && y == this.yPos + 1)) {
			return true;
			// otherwise it returns false
		} else
			return false;
	}

	/*
	 * the castle method is a way to do the castle move which consists of moving the
	 * king into a corner and moving a rook beside it, however castling works
	 * slightly different depending on the rook that the king is using to castle,
	 * this is why it uses the method isValidCastle which in itself uses the methods
	 * checkSides and checkRooks
	 */
	@Override
	public void castle(Piece[][] aBoard, int x, int y, int rookX, int rookY) {
		/*
		 * first it calls isValidCastle then it checks y to confirm the direction the
		 * king is castling to
		 */
		if (isValidCastle(aBoard, y, this.movedFlag, checkSides(aBoard), checkRooks(aBoard))) {
			if (y > this.yPos) {
				/*
				 * if the king is castling to the right then it creates a new king in the
				 * specified x,y position, then it creates a new rook to the left of that, it
				 * then changes the previous king and rook to empty spaces
				 */
				aBoard[x][y] = new King(x, y, this.color, true);
				aBoard[x][y - 1] = new Rook(x, y, this.color, true);
				aBoard[this.xPos][this.yPos] = new Piece();
				aBoard[rookX][rookY] = new Piece();
			} else {
				/*
				 * if the king is castling to the left then it creates a new king in the
				 * specified x,y position, then it creates a new rook to the right of that, it
				 * then changes the previous king and rook to empty spaces
				 */
				aBoard[x][y] = new King(x, y, this.color, true);
				aBoard[x][y + 1] = new Rook(x, y, this.color, true);
				aBoard[this.xPos][this.yPos] = new Piece();
				aBoard[rookX][rookY] = new Piece();
			}
		} else {
			System.out.println("Invalid Move");
		}
	}

	/*
	 * isValidCastle works by calling checkSides and checkRooks and getting the
	 * appropriate values from the returned array to determine if castling is valid
	 */
	public boolean isValidCastle(Piece[][] aBoard, int y, boolean hasMoved, boolean[] sides, boolean[] rooks) {
		/*
		 * first it checks if the king has moved and checks y to determine if the king
		 * is castling to the right or left
		 */
		if (hasMoved == false && y > this.yPos) {
			// if it's castling right it grabs the second index of the returned arrays
			if (sides[1] && rooks[1]) {
				// if both are true the method returns true
				return true;
			} else
				return false;
			// if it's castling left it grabs the first index of the returned arrays
		} else if (hasMoved == false && y < this.yPos) {
			// if both are true the method returns true
			if (sides[0] && rooks[0]) {
				return true;
			} else
				return false;
			// if the king has moved the method returns false
		} else
			return false;
	}

	/*
	 * checkSides works by determining whether the king is black or white then
	 * checking the left and right side of the king to see if there are any pieces,
	 * it then saves the resulting boolean to an array, the result of the left side
	 * goes to the first index and the result of the right side goes to the second
	 * index
	 */
	public boolean[] checkSides(Piece[][] aBoard) {
		boolean flag[] = new boolean[2];
		flag[0] = true;
		flag[1] = true;
		// if the king is white it checks the left and right side of the bottom row
		if (this.color.equals("white")) {
			// it then loops through every space to the right
			for (int i = 5; i < 7; i++) {
				// if any space isn't empty it returns false
				if (aBoard[7][i].isEmpty() == false) {
					flag[1] = false;
				}
			}
			// it then loops through every space to the left
			for (int i = 3; i > 0; i--) {
				// if any space isn't empty it returns false
				if (aBoard[7][i].isEmpty() == false) {
					flag[0] = false;
				}
			}
			// if the king is black it checks the left and right side of the top row
		} else {
			// it then loops through every space to the right
			for (int i = 5; i < 7; i++) {
				// if any space isn't empty it returns false
				if (aBoard[0][i].isEmpty() == false) {
					flag[1] = false;
				}
			}
			// it then loops through every space to the left
			for (int i = 3; i > 0; i--) {
				// if any space isn't empty it returns false
				if (aBoard[0][i].isEmpty() == false) {
					flag[0] = false;
				}
			}
		}
		return flag;
	}

	/*
	 * checkRooks works by determining whether the king is black or white then
	 * checking the left and right corners of the corresponding row to see if the
	 * rooks are in place and haven't moved, it then saves the resulting boolean to
	 * an array, the result of the left corner goes to the first index and the
	 * result of the right corner goes to the second index
	 */
	public boolean[] checkRooks(Piece[][] aBoard) {
		boolean[] flag = new boolean[2];
		flag[0] = false;
		flag[1] = false;
		// if the king is white it checks the bottom-left and bottom-right corners
		if (this.color.equals("white")) {
			// if the bottom left corner has an unmoved white rook it returns true
			if (aBoard[7][0].name.equals("[WhRk]") && (aBoard[7][0].movedFlag) == false) {
				flag[0] = true;
			}
			// if the bottom right corner has an unmoved white rook it returns true
			if (aBoard[7][7].name.equals("[WhRk]") && (aBoard[7][7].movedFlag) == false) {
				flag[1] = true;
			}
			// if the king is black it checks the top-left and top-right corners
		} else {
			// if the top left corner has an unmoved black rook it returns true
			if (aBoard[0][0].name.equals("[BlRk]") && (aBoard[0][0].movedFlag) == false) {
				flag[0] = true;
			}
			// if the top right corner has an unmoved black rook it returns true
			if (aBoard[0][7].name.equals("[BlRk]") && (aBoard[0][7].movedFlag) == false) {
				flag[1] = true;
			}
		}
		return flag;
	}

	/*
	 * checkMate checks whether the king is in check and has no viable option thus
	 * being a checkMate
	 */
	@Override
	public boolean checkMate(Piece[][] aBoard) {
		// if the king is in a corner of the board it calls inCheck and canMoveCornered
		if ((this.xPos == 0 && this.yPos == 0) || (this.xPos == 0 && this.yPos == 7)
				|| (this.xPos == 7 && this.yPos == 0) || (this.xPos == 7 && this.yPos == 7)) {
			if (inCheck(aBoard, this.xPos, this.yPos) && canMoveCornered(aBoard) == false) {
				// if the king is in check and has no safe option the method returns true
				return true;
			} else
				return false;
			// if the king is in an edge of the board it calls inCheck and canMoveEdges
		} else if ((this.xPos == 0) || (this.xPos == 7) || (this.yPos == 0) || (this.yPos == 7)) {
			if (inCheck(aBoard, this.xPos, this.yPos) && canMoveEdges(aBoard) == false) {
				// if the king is in check and has safe no option the method returns true
				return true;
			} else
				return false;
			// if the king isn't in an edge or corner it calls inCheck and canMove
		} else {
			if (inCheck(aBoard, this.xPos, this.yPos) && canMove(aBoard) == false) {
				// if the king is in check and has no safe option the method returns true
				return true;
			} else
				return false;
		}
	}

	/*
	 * inCheck method determines if a piece is in danger of being eaten, it does
	 * this by looping through every piece of the array and calling their isValid
	 * method with the x,y position of the current piece
	 */
	public boolean inCheck(Piece[][] aBoard, int x, int y) {
		boolean flag = false;
		// this double nested loops runs through every piece in the board
		for (int i = 0; i < aBoard.length; i++) {
			for (int j = 0; j < aBoard[i].length; j++) {
				/*
				 * first it checks if the piece in question is a pawn since it is the only piece
				 * with a distinct isValidEat method
				 */
				if (aBoard[i][j].name.equals("[WhPn]") || aBoard[i][j].name.equals("[BlPn]")) {
					// if the piece is a pawn it checks its color and calls isValidEat
					if (aBoard[i][j].isValidEat(aBoard, x, y) && aBoard[i][j].color.equals(this.color) == false) {
						flag = true;
						break;
					}
				} else {
					// if the piece isn't a pawn it checks its color and calls isValid
					if (aBoard[i][j].isValid(aBoard, x, y) && aBoard[i][j].color.equals(this.color) == false) {
						flag = true;
						break;
					}
				}
			}
		}
		return flag;
	}

	/*
	 * 
	 * =============================================================================
	 * 
	 * the methods canMove, canMoveCornered, and canMoves all check the spaces
	 * around king to check if the king has a safe option, however checking all
	 * spaces around the king will cause an out of bounds exception, which is why
	 * there are three methods that do the same thing but slightly differently, all
	 * three methods are walls of redundant (and very inefficient) code so don't
	 * read it, all you need to know is that depending on the kings position it
	 * checks the possible spaces around it and calls the isEmpty and inCheck method
	 * 
	 * =============================================================================
	 * 
	 */

	public boolean canMoveCornered(Piece[][] aBoard) {
		if (this.xPos == 0 && this.yPos == 0) {
			if (aBoard[this.xPos][this.yPos + 1].isEmpty() && inCheck(aBoard, this.xPos, this.yPos + 1) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos + 1].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos + 1) == false) {
				return true;
			} else
				return false;
		} else if (this.xPos == 0 && this.yPos == 7) {
			if (aBoard[this.xPos][this.yPos - 1].isEmpty() && inCheck(aBoard, this.xPos, this.yPos - 1) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos - 1].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos - 1) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos) == false) {
				return true;
			} else
				return false;
		} else if (this.xPos == 7 && this.yPos == 0) {
			if (aBoard[this.xPos - 1][this.yPos].isEmpty() && inCheck(aBoard, this.xPos - 1, this.yPos) == false) {
				return true;
			} else if (aBoard[this.xPos - 1][this.yPos + 1].isEmpty()
					&& inCheck(aBoard, this.xPos - 1, this.yPos + 1) == false) {
				return true;
			} else if (aBoard[this.xPos][this.yPos + 1].isEmpty()
					&& inCheck(aBoard, this.xPos, this.yPos + 1) == false) {
				return true;
			} else
				return false;
		} else if (this.xPos == 7 && this.yPos == 7) {
			if (aBoard[this.xPos][this.yPos - 1].isEmpty() && inCheck(aBoard, this.xPos, this.yPos - 1) == false) {
				return true;
			} else if (aBoard[this.xPos - 1][this.yPos - 1].isEmpty()
					&& inCheck(aBoard, this.xPos - 1, this.yPos - 1) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos) == false) {
				return true;
			} else
				return false;
		} else
			return false;
	}

	public boolean canMoveEdges(Piece[][] aBoard) {
		if (this.xPos == 0) {
			if (aBoard[this.xPos][this.yPos - 1].isEmpty() && inCheck(aBoard, this.xPos, this.yPos - 1) == false) {
				return true;
			} else if (aBoard[this.xPos][this.yPos + 1].isEmpty()
					&& inCheck(aBoard, this.xPos, this.yPos + 1) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos - 1].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos - 1) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos + 1].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos + 1) == false) {
				return true;
			} else
				return false;
		} else if (this.yPos == 0) {
			if (aBoard[this.xPos - 1][this.yPos].isEmpty() && inCheck(aBoard, this.xPos - 1, this.yPos) == false) {
				return true;
			} else if (aBoard[this.xPos - 1][this.yPos + 1].isEmpty()
					&& inCheck(aBoard, this.xPos - 1, this.yPos + 1) == false) {
				return true;
			} else if (aBoard[this.xPos][this.yPos + 1].isEmpty()
					&& inCheck(aBoard, this.xPos, this.yPos + 1) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos + 1].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos + 1) == false) {
				return true;
			} else
				return false;
		} else if (this.yPos == 7) {
			if (aBoard[this.xPos - 1][this.yPos].isEmpty() && inCheck(aBoard, this.xPos - 1, this.yPos) == false) {
				return true;
			} else if (aBoard[this.xPos - 1][this.yPos - 1].isEmpty()
					&& inCheck(aBoard, this.xPos - 1, this.yPos - 1) == false) {
				return true;
			} else if (aBoard[this.xPos][this.yPos - 1].isEmpty()
					&& inCheck(aBoard, this.xPos, this.yPos - 1) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos - 1].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos - 1) == false) {
				return true;
			} else if (aBoard[this.xPos + 1][this.yPos].isEmpty()
					&& inCheck(aBoard, this.xPos + 1, this.yPos) == false) {
				return true;
			} else
				return false;
		} else if (this.xPos == 7) {
			if (aBoard[this.xPos - 1][this.yPos - 1].isEmpty()
					&& inCheck(aBoard, this.xPos - 1, this.yPos - 1) == false) {
				return true;
			} else if (aBoard[this.xPos - 1][this.yPos].isEmpty()
					&& inCheck(aBoard, this.xPos - 1, this.yPos) == false) {
				return true;
			} else if (aBoard[this.xPos - 1][this.yPos + 1].isEmpty()
					&& inCheck(aBoard, this.xPos - 1, this.yPos + 1) == false) {
				return true;
			} else if (aBoard[this.xPos][this.yPos - 1].isEmpty()
					&& inCheck(aBoard, this.xPos, this.yPos - 1) == false) {
				return true;
			} else if (aBoard[this.xPos][this.yPos + 1].isEmpty()
					&& inCheck(aBoard, this.xPos, this.yPos + 1) == false) {
				return true;
			} else
				return false;
		} else
			return false;
	}

	public boolean canMove(Piece[][] aBoard) {
		if (aBoard[this.xPos - 1][this.yPos - 1].isEmpty() && inCheck(aBoard, this.xPos - 1, this.yPos - 1) == false) {
			return true;
		} else if (aBoard[this.xPos - 1][this.yPos].isEmpty() && inCheck(aBoard, this.xPos - 1, this.yPos) == false) {
			return true;
		} else if (aBoard[this.xPos - 1][this.yPos + 1].isEmpty()
				&& inCheck(aBoard, this.xPos - 1, this.yPos + 1) == false) {
			return true;
		} else if (aBoard[this.xPos][this.yPos - 1].isEmpty() && inCheck(aBoard, this.xPos, this.yPos - 1) == false) {
			return true;
		} else if (aBoard[this.xPos][this.yPos + 1].isEmpty() && inCheck(aBoard, this.xPos, this.yPos + 1) == false) {
			return true;
		} else if (aBoard[this.xPos + 1][this.yPos - 1].isEmpty()
				&& inCheck(aBoard, this.xPos + 1, this.yPos - 1) == false) {
			return true;
		} else if (aBoard[this.xPos + 1][this.yPos].isEmpty() && inCheck(aBoard, this.xPos + 1, this.yPos) == false) {
			return true;
		} else if (aBoard[this.xPos + 1][this.yPos + 1].isEmpty()
				&& inCheck(aBoard, this.xPos + 1, this.yPos + 1) == false) {
			return true;
		} else
			return false;
	}
}
