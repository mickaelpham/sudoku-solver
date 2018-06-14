class SudokuSolver
  private_class_method :new

  def self.solve(board)
    new(board).solve
  end

  def solve
    until empty_cells.empty?
      empty_cells.each.with_index do |at, index|
        possible = ('1'..'9').to_a - col(at) - row(at) - sub_box(at)

        case possible.size
        when 0
          raise "no possible value at #{at}"
        when 1
          board[at[ROW]][at[COL]] = possible[0]
          empty_cells.delete_at(index)
        end
      end
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