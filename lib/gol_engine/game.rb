# frozen_string_literal: true

module GolEngine
  class Game
    def tick(world)
      world.map.with_index do |row, i|
        row.map.with_index do |cell, j|
          case active_neighbors(world, i, j)
          when 0
            :dead
          end
        end
      end
    end

    private

    def active_neighbors(world, i, j)
      0
    end
  end
end
