# frozen_string_literal: true

module GolEngine
  class Game
    def tick(world)
      world.map.with_index do |row, i|
        row.map.with_index do |cell, j|
          case active_neighbors(world, i, j)
          when 0
            :dead
          when 1
            :dead
          when 2
            cell == :alive ? :alive : :dead
          when 3
            :alive
          else
            :dead
          end
        end
      end
    end

    private

    def active_neighbors(world, i, j)
      [i - 1, i , i + 1].product([j - 1, j , j + 1])
        .reject {|ni, nj| ni == i && nj == j}
        .map {|ni, nj| fetch(world, ni, nj)}
        .count(:alive)
    end

    def fetch(world, i, j)
      return if i < 0
      return if i >= world.size
      return if j < 0
      return if j >= world[i].size

      return world[i][j]
    end
  end
end
