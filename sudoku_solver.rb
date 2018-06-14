class SudokuSolver
  private_class_method :new

  def self.solve(board)
    new(board).solve
  end

  def solve
    index = 0
    while index < empty_cells.size
      at  = empty_cells[index]
      val = board[at[ROW]][at[COL]]

      if val == '.'
        board[at[ROW]][at[COL]] = '1'
      elsif val == '9'
        # backtrack
        board[at[ROW]][at[COL]] = '.'
        index -= 1
        next
      else
        board[at[ROW]][at[COL]] = (val.to_i + 1).to_s
      end

      index += 1 if valid?(at)
    end
  end

  private

  attr_reader :board

  ROW = 0
  COL = 1

  def initialize(board)
    @board = board
  end

  def empty_cells
    @empty_cells ||= board.each.with_index.with_object([]) do |(row, i), cells|
      row.each.with_index do |col, j|
        cells << [i, j] if col == '.'
      end
    end
  end

  def valid?(at)
    [row(at), col(at), sub_box(at)].all? do |cells|
      cells.one? { |cell| cell == board[at[ROW]][at[COL]] }
    end
  end

  def row(at)
    board[at[ROW]]
  end

  def col(at)
    board.map { |row| row[at[COL]] }
  end

  def sub_box(at)
    row = (at[ROW] / 3) * 3
    col = (at[COL] / 3) * 3

    [
      board[row][col],   board[row][col+1],   board[row][col+2],
      board[row+1][col], board[row+1][col+1], board[row+1][col+2],
      board[row+2][col], board[row+2][col+1], board[row+2][col+2],
    ]
  end
end