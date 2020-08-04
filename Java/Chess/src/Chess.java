import Pieces.Piece;

public class Chess {
	static Board board = new Board();

	public static void main(String[] args) {
		Piece[][] gameBoard = board.generateBoard();
		board.printBoard(gameBoard);
	}
}