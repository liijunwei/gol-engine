# frozen_string_literal: true

module GolEngine
  class Game
    def tick(world)
      world1 = GolEngine::World.new(world)

      world.map.with_index do |row, i|
        row.map.with_index do |cell, j|
          case world1.active_neighbors(i, j)
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
  end
end
