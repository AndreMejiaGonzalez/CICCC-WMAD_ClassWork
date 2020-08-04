package Pieces;

public class Piece {
	/*
	 * Piece is the super class of every other piece every piece has a name, an x
	 * and y position, a movedFlag and a color all these are defined in each piece's
	 * constructor default pieces get the name "[    ]" since they act as empty
	 * spaces
	 */
	public String name = "[    ]";
	public int xPos;
	public int yPos;
	public boolean movedFlag;
	public String color;

	/*
	 * all the methods in Piece are methods that have to be called on main, since
	 * calling a method on main requires calling it from a piece in the board array,
	 * the method has to be in the piece super class other wise it won't compile
	 * because all pieces in the array are treated as generic Piece objects even
	 * though they are objects of their specific class
	 */

	// every piece has a move method the body of the method depends on the class
	public void move(Piece[][] aBoard, int x, int y) {
	}

	// every piece has an eat method the body of the method depends on the class
	public void eat(Piece[][] aBoard, int x, int y) {
	}

	/*
	 * isEmpty is the only method that doesn't change at all in any class so it's
	 * written in the Piece super class
	 */
	public boolean isEmpty() {
		if (this.name.equals("[    ]")) {
			return true;
		} else {
			return false;
		}
	}

	/*
	 * every piece has their own individual isValid method which makes sure every
	 * piece can only move the way it's supposed to
	 */
	public boolean isValid(Piece[][] aBoard, int x, int y) {
		return false;
	}

	/*
	 * isValidEat is only used by pawn since it's the only one that has different
	 * rules for eating, will return false if called by any other piece
	 */
	public boolean isValidEat(Piece[][] aBoard, int x, int y) {
		return false;
	}

	/*
	 * castle is only used by king, if called by any other piece it won't do
	 * anything
	 */
	public void castle(Piece[][] aBoard, int x, int y, int rookX, int rookY) {

	}

	/*
	 * checkMate is only used by king, if called by any other piece it will simply
	 * return false;
	 */
	public boolean checkMate(Piece[][] aBoard) {
		return false;
	}

	/*
	 * promote is only used by pawn since it's the only one who can turn into
	 * another piece, if called by any other piece it won't do anything
	 */
	public void promote(Piece[][] aBoard, int choice) {

	}
}