require 'minitest/autorun'
require_relative 'sudoku_solver'

class TestSudokuSolver < Minitest::Test
  make_my_diffs_pretty!

  def test_solve_one_missing_element
    board = [
      %w[5 3 4 6 7 8 9 1 2],
      %w[6 7 2 1 9 5 3 4 8],
      %w[1 9 8 3 4 2 5 6 7],
      %w[8 5 9 7 6 1 4 2 3],
      %w[4 2 6 8 . 3 7 9 1],
      %w[7 1 3 9 2 4 8 5 6],
      %w[9 6 1 5 3 7 2 8 4],
      %w[2 8 7 4 1 9 6 3 5],
      %w[3 4 5 2 8 6 1 7 9]
    ]

    solved_board = [
      %w[5 3 4 6 7 8 9 1 2],
      %w[6 7 2 1 9 5 3 4 8],
      %w[1 9 8 3 4 2 5 6 7],
      %w[8 5 9 7 6 1 4 2 3],
      %w[4 2 6 8 5 3 7 9 1],
      %w[7 1 3 9 2 4 8 5 6],
      %w[9 6 1 5 3 7 2 8 4],
      %w[2 8 7 4 1 9 6 3 5],
      %w[3 4 5 2 8 6 1 7 9]
    ]

    SudokuSolver.solve(board)

    assert_equal solved_board, board
  end

  def test_solve_full_sudoku_puzzle
    board = [
      %w[5 3 . . 7 . . . .],
      %w[6 . . 1 9 5 . . .],
      %w[. 9 8 . . . . 6 .],
      %w[8 . . . 6 . . . 3],
      %w[4 . . 8 . 3 . . 1],
      %w[7 . . . 2 . . . 6],
      %w[. 6 . . . . 2 8 .],
      %w[. . . 4 1 9 . . 5],
      %w[. . . . 8 . . 7 9]
    ]

    solved_board = [
      %w[5 3 4 6 7 8 9 1 2],
      %w[6 7 2 1 9 5 3 4 8],
      %w[1 9 8 3 4 2 5 6 7],
      %w[8 5 9 7 6 1 4 2 3],
      %w[4 2 6 8 5 3 7 9 1],
      %w[7 1 3 9 2 4 8 5 6],
      %w[9 6 1 5 3 7 2 8 4],
      %w[2 8 7 4 1 9 6 3 5],
      %w[3 4 5 2 8 6 1 7 9]
    ]

    SudokuSolver.solve(board)

    assert_equal solved_board, board
  end

  def test_invalid_sudoku
    board = [
      %w[5 5 . . 7 . . . .],
      %w[6 . . 1 9 5 . . .],
      %w[. 9 8 . . . . 6 .],
      %w[8 . . . 6 . . . 3],
      %w[4 . . 8 . 3 . . 1],
      %w[7 . . . 2 . . . 6],
      %w[. 6 . . . . 2 8 .],
      %w[. . . 4 1 9 . . 5],
      %w[. . . . 8 . . 7 9]
    ]

    assert_raises(RuntimeError, 'invalid sudoku') { SudokuSolver.solve(board) }
  end
end