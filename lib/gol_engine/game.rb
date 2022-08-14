# frozen_string_literal: true

module GolEngine
  class Game
    def tick(world)
      world.map do |row|
        row.map do |cell|
          :dead
        end
      end
    end
  end
end
