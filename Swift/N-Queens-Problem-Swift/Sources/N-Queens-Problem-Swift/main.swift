var board1 = Board(size:8)
var board2 = Board(size:8)

//Single-Solution function call
solveQueens(&board1)
print("Recursive Calls: \(count)\n\(board1)")

//All-Solutions function call
solveQueens(&board2, 0, true)
print("Solutions: \(solutions)")