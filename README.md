# Sudoku solver

Simple implementation which:

1. Fill the first empty cell with `'1'`
2. If it’s valid, go to the next empty cell
3. If it’s invalid, increment the value

Backtracking is implemented if the value is still invalid once we reached `'9'`
for the current cell. We then revert to the previous cell and increment it.

## Execution

If you have `ruby` installed, simply run the test:

```rb
ruby test_sudoku_solver.rb
```

Else, you can go to [repl.it](https://repl.it) and start a Ruby session. Copy
the code from `sudoku_solver.rb` and add the following right after the class to
execute a sample code:

```rb
# insert content from sudoku_solver.rb

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

SudokuSolver.solve(board)

pp board; nil
```