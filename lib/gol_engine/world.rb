# frozen_string_literal: true

module GolEngine
  class World
    attr_reader :world

    def initialize(world)
      @world = world
    end

    def active_neighbors(i, j)
      [i - 1, i , i + 1].product([j - 1, j , j + 1])
        .reject {|ni, nj| ni == i && nj == j}
        .map {|ni, nj| fetch(ni, nj)}
        .count(:alive)
    end

    def fetch(i, j)
      return if i < 0
      return if i >= world.size
      return if j < 0
      return if j >= world[i].size

      return world[i][j]
    end
  end
end
