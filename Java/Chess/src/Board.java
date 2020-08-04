import java.util.Arrays;

import Pieces.Bishop;
import Pieces.King;
import Pieces.Knight;
import Pieces.Pawn;
import Pieces.Piece;
import Pieces.Queen;
import Pieces.Rook;

public class Board {
	// generateBoard creates the initial array that will serve as our Chess Board
	public Piece[][] generateBoard() {
		// first it creates an 8*8 2D array of objects type piece
		Piece[][] pieceArray = new Piece[8][8];
		/*
		 * then it runs through every index of the array and creates the corresponding
		 * piece
		 */
		for (int i = 0; i < pieceArray.length; i++) {
			for (int j = 0; j < pieceArray[i].length; j++) {
				if (i == pieceArray.length - 2) {
					// it creates a white pawn in every index of the second row
					pieceArray[i][j] = new Pawn(i, j, "white", false);
				} else if (i == 1) {
					// and it creates a black pawn in every index of the second to last row
					pieceArray[i][j] = new Pawn(i, j, "black", false);
				} else if (i == 0) {
					// it creates the corresponding black pieces in order on the last row
					switch (j) {
					case 0:
						pieceArray[i][j] = new Rook(i, j, "black", false);
						break;

					case 1:
						pieceArray[i][j] = new Knight(i, j, "black");
						break;

					case 2:
						pieceArray[i][j] = new Bishop(i, j, "black");
						break;

					case 3:
						pieceArray[i][j] = new Queen(i, j, "black");
						break;

					case 4:
						pieceArray[i][j] = new King(i, j, "black", false);
						break;

					case 5:
						pieceArray[i][j] = new Bishop(i, j, "black");
						break;

					case 6:
						pieceArray[i][j] = new Knight(i, j, "black");
						break;

					default:
						pieceArray[i][j] = new Rook(i, j, "black", false);
						break;
					}
				} else if (i == pieceArray.length - 1) {
					// it creates the corresponding white pieces in order on the first row
					switch (j) {
					case 0:
						pieceArray[i][j] = new Rook(i, j, "white", false);
						break;

					case 1:
						pieceArray[i][j] = new Knight(i, j, "white");
						break;

					case 2:
						pieceArray[i][j] = new Bishop(i, j, "white");
						break;

					case 3:
						pieceArray[i][j] = new Queen(i, j, "white");
						break;

					case 4:
						pieceArray[i][j] = new King(i, j, "white", false);
						break;

					case 5:
						pieceArray[i][j] = new Bishop(i, j, "white");
						break;

					case 6:
						pieceArray[i][j] = new Knight(i, j, "white");
						break;

					default:
						pieceArray[i][j] = new Rook(i, j, "white", false);
						break;
					}
				} else {
					// it creates default pieces everywhere else these act as empty spaces
					pieceArray[i][j] = new Piece();
				}
			}
		}
		return pieceArray;
	}

	/*
	 * printBoard simply creates an array of strings by getting the name of every
	 * piece than prints the array line by line
	 */
	public void printBoard(Piece[][] aPieceArray) {
		String[][] board = new String[8][8];
		System.out.println("     A       B       C       D       E       F       G       H ");
		for (int i = 0; i < board.length; i++) {
			for (int j = 0; j < board[i].length; j++) {
				board[i][j] = aPieceArray[i][j].name;
			}
			System.out.println(8 - i + " " + Arrays.deepToString(board[i]));
			System.out.println();
		}
	}
}