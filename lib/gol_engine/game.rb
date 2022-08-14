# frozen_string_literal: true

module GolEngine
  class Game
    def tick(old_world)
      world = GolEngine::World.new(old_world)

      new_world =
      world.grid.map.with_index do |row, i|
        row.map.with_index do |cell, j|
          case world.active_neighbors(i, j)
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

      new_world
    end
  end
end
