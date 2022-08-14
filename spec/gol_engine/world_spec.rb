# frozen_string_literal: true

RSpec.describe GolEngine::World do
  describe "#active_neighbors_of" do
    context "when current cell is alive" do
      it "has 0 alive neighbors" do
        world = described_class.new([[:alive]])
        expect(world.active_neighbors_of(0, 0)).to eq(0)
      end

      it "has 1 alive neighbors" do
        world1 = described_class.new([[:alive, :alive]])
        expect(world1.active_neighbors_of(0, 0)).to eq(1)

        world2 = described_class.new([[:alive], [:alive]])
        expect(world2.active_neighbors_of(0, 0)).to eq(1)
      end

      it "has 2 alive neighbors" do
        world1 = described_class.new([[:alive, :alive, :alive]])
        expect(world1.active_neighbors_of(0, 1)).to eq(2)

        world2 = described_class.new([[:alive],[:alive],[:alive]])
        expect(world2.active_neighbors_of(1, 0)).to eq(2)

        world3 = described_class.new([
          [:alive],
          [:alive, :alive]
        ])
        expect(world3.active_neighbors_of(0, 0)).to eq(2)
        expect(world3.active_neighbors_of(1, 0)).to eq(2)
        expect(world3.active_neighbors_of(1, 1)).to eq(2)
      end

      it "has 3 alive neighbors" do
        world1 = described_class.new([
          [:alive, :alive],
          [:alive, :alive]
        ])
        expect(world1.active_neighbors_of(0, 0)).to eq(3)
        expect(world1.active_neighbors_of(0, 1)).to eq(3)
        expect(world1.active_neighbors_of(1, 0)).to eq(3)
        expect(world1.active_neighbors_of(1, 1)).to eq(3)

        world2 = described_class.new([
          [:alive],
          [:alive, :alive, :alive],
        ])
        expect(world2.active_neighbors_of(1, 1)).to eq(3)

        world3 = described_class.new([
          [:alive, :alive],
          [:alive],
          [:alive]
        ])
        expect(world3.active_neighbors_of(1, 0)).to eq(3)
      end

      it "has 4/5/6/7/8 alive neighbors" do
        world1 = described_class.new([
          [:alive, :alive],
          [:alive, :alive, :alive]
        ])
        expect(world1.active_neighbors_of(1, 1)).to eq(4)

        world2 = described_class.new([
          [:alive, :alive, :alive],
          [:alive, :alive, :alive]
        ])
        expect(world2.active_neighbors_of(0, 1)).to eq(5)
        expect(world2.active_neighbors_of(1, 1)).to eq(5)

        world3 = described_class.new([
          [:alive],
          [:alive, :alive, :alive],
          [:alive, :alive, :alive]
        ])
        expect(world3.active_neighbors_of(1, 1)).to eq(6)

        world3 = described_class.new([
          [:alive, :alive],
          [:alive, :alive, :alive],
          [:alive, :alive, :alive]
        ])
        expect(world3.active_neighbors_of(1, 1)).to eq(7)

        world3 = described_class.new([
          [:alive, :alive, :alive],
          [:alive, :alive, :alive],
          [:alive, :alive, :alive]
        ])
        expect(world3.active_neighbors_of(1, 1)).to eq(8)
      end
    end

    context "when current cell is dead" do
      it "has 0 alive neighbors" do
        world = described_class.new([[:dead]])
        expect(world.active_neighbors_of(0, 0)).to eq(0)
      end

      it "has 1 alive neighbors" do
        world1 = described_class.new([[:dead, :alive]])
        expect(world1.active_neighbors_of(0, 0)).to eq(1)

        world2 = described_class.new([[:dead], [:alive]])
        expect(world2.active_neighbors_of(0, 0)).to eq(1)
      end

      it "has 2 alive neighbors" do
        world1 = described_class.new([[:alive, :dead, :alive]])
        expect(world1.active_neighbors_of(0, 1)).to eq(2)

        world2 = described_class.new([[:alive],[:dead],[:alive]])
        expect(world2.active_neighbors_of(1, 0)).to eq(2)

        world3 = described_class.new([
          [:dead],
          [:alive, :alive]
        ])
        expect(world3.active_neighbors_of(0, 0)).to eq(2)
      end

      it "has 3 alive neighbors" do
        world1 = described_class.new([
          [:dead, :alive],
          [:alive, :alive]
        ])
        expect(world1.active_neighbors_of(0, 0)).to eq(3)

        world2 = described_class.new([
          [:alive],
          [:alive, :dead, :alive],
        ])
        expect(world2.active_neighbors_of(1, 1)).to eq(3)

        world3 = described_class.new([
          [:alive, :alive],
          [:dead],
          [:alive]
        ])
        expect(world3.active_neighbors_of(1, 0)).to eq(3)
      end

      it "has 4/5/6/7/8 alive neighbors" do
        world1 = described_class.new([
          [:alive, :alive],
          [:alive, :dead, :alive]
        ])
        expect(world1.active_neighbors_of(1, 1)).to eq(4)

        world2 = described_class.new([
          [:alive, :dead, :alive],
          [:alive, :alive, :alive]
        ])
        expect(world2.active_neighbors_of(0, 1)).to eq(5)

        world3 = described_class.new([
          [:alive],
          [:alive, :dead, :alive],
          [:alive, :alive, :alive]
        ])
        expect(world3.active_neighbors_of(1, 1)).to eq(6)

        world3 = described_class.new([
          [:alive, :alive],
          [:alive, :dead, :alive],
          [:alive, :alive, :alive]
        ])
        expect(world3.active_neighbors_of(1, 1)).to eq(7)

        world3 = described_class.new([
          [:alive, :alive, :alive],
          [:alive, :dead, :alive],
          [:alive, :alive, :alive]
        ])
        expect(world3.active_neighbors_of(1, 1)).to eq(8)
      end
    end
  end

  describe "#fetch" do
    it "gets the value within boundary" do
      world = described_class.new([
        [:alive, :alive],
        [:alive, :dead, :alive]
      ])
      expect(world.fetch(0, 0)).to eq(:alive)
      expect(world.fetch(0, 1)).to eq(:alive)
      expect(world.fetch(1, 0)).to eq(:alive)
      expect(world.fetch(1, 1)).to eq(:dead)
      expect(world.fetch(1, 2)).to eq(:alive)
    end

    it "fails for out of x boundary" do
      world = described_class.new([
        [:alive, :alive],
        [:alive, :dead, :alive]
      ])
      expect(world.fetch(-10, 0)).to be_nil
      expect(world.fetch(-1, 0)).to be_nil
      expect(world.fetch(2, 0)).to be_nil
      expect(world.fetch(20, 0)).to be_nil
    end

    it "fails for out of y boundary" do
      world = described_class.new([
        [:alive, :alive],
        [:alive, :dead, :alive]
      ])
      expect(world.fetch(0, -10)).to be_nil
      expect(world.fetch(0, -1)).to be_nil
      expect(world.fetch(0, 2)).to be_nil
      expect(world.fetch(0, 20)).to be_nil
    end
  end
end
