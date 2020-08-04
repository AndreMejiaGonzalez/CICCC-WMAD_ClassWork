//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var count = 0
var solutions = 0
func solveQueens(_ board: inout Board, _ row: Int = 0, _ findAll: Bool = false) -> Bool {
	count += 1
    if row == board.size {
        if findAll {
            print(board)
            solutions += 1
            return false
        }
        return true
    } else {
        for i in 0..<board.size {
            if board.isSafe(row: row, col: i) {
                board.place(row: row, col: i)
                if solveQueens(&board, row + 1, findAll) {
                    if !findAll {
                        return true
                    }
                } else {
                    board.remove(row: row, col: i)
                }
            }
        }
        return false
    }
}