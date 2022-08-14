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
            :alive
          end
        end
      end
    end

    private

    def active_neighbors(world, i, j)
      [[0, j - 1], [0, j + 1]]
        .map {|ni, nj| fetch(world, ni, nj)}
        .count(:alive)
    end

    def fetch(world, i, j)
      return if j < 0
      return if j >= world[0].size

      return world[i][j]
    end
  end
end
