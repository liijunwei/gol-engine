# frozen_string_literal: true

RSpec.describe GolEngine::Game do
  it "responds to #tick" do
    expect(subject).to respond_to(:tick)
  end

  describe "#tick" do
    context "when current cell is alive" do
      it "dies with 0 alive neighbors(underpopulation)" do
        world = [[:alive]]
        expect(subject.tick(world)).to eq([[:dead]])
      end

      it "dies with 1 alive neighbors(underpopulation)" do
        world = [[:alive, :alive]]
        expect(subject.tick(world)).to eq([[:dead, :dead]])
      end

      it "survives with 2 alive neighbors" do
        world1 = [[:alive, :alive, :alive]]
        expect(subject.tick(world1)).to eq([[:dead, :alive, :dead]])

        world2 = [[:alive],[:alive],[:alive]]
        expect(subject.tick(world2)).to eq([[:dead],[:alive],[:dead]])
      end

      it "survives with 3 alive neighbors" do
        world1 = [
          [:alive, :alive],
          [:alive, :alive]
        ]
        expect(subject.tick(world1)).to eq([
          [:alive, :alive],
          [:alive, :alive]
        ])

        world2 = [
          [:alive],
          [:alive, :alive, :alive],
        ]
        expect(subject.tick(world2)).to eq([
          [:alive],
          [:alive, :alive, :dead],
        ])

        world3 = [
          [:alive, :alive],
          [:alive],
          [:alive]
        ]
        expect(subject.tick(world3)).to eq([
          [:alive, :alive],
          [:alive],
          [:dead]
        ])
      end

      it "dies with 4 alive neighbors(overpopulation)" do
        world1 = [
          [:alive, :alive],
          [:alive, :alive, :alive]
        ]
        expect(subject.tick(world1)).to eq([
          [:alive, :dead],
          [:alive, :dead, :alive]
        ])

        world2 = [
          [:alive, :alive],
          [:alive, :alive],
          [:alive],
        ]
        expect(subject.tick(world2)).to eq([
          [:alive, :alive],
          [:dead, :dead],
          [:alive],
        ])

        world3 = [
          [:alive],
          [:alive, :alive, :alive],
          [:alive],
        ]
        expect(subject.tick(world3)).to eq([
          [:alive],
          [:alive, :dead, :dead],
          [:alive],
        ])
      end

      it "dies with 5 alive neighbors(overpopulation)" do
        world1 = [
          [:alive, :alive, :alive],
          [:alive, :alive, :alive]
        ]
        expect(subject.tick(world1)).to eq([
          [:alive, :dead, :alive],
          [:alive, :dead, :alive]
        ])

        world2 = [
          [:alive],
          [:alive, :alive],
          [:alive, :alive, :alive]
        ]
        expect(subject.tick(world2)).to eq([
          [:alive],
          [:dead, :dead],
          [:alive, :dead, :alive]
        ])
      end

      it "dies with 6 alive neighbors(overpopulation)" do
        world1 = [
          [:alive],
          [:alive, :alive, :alive],
          [:alive, :alive, :alive]
        ]
        expect(subject.tick(world1)).to eq([
          [:alive],
          [:dead, :dead, :alive],
          [:alive, :dead, :alive]
        ])

        world2 = [
          [:alive, :alive],
          [:alive, :alive],
          [:alive, :alive, :alive]
        ]
        expect(subject.tick(world2)).to eq([
          [:alive, :alive],
          [:dead, :dead],
          [:alive, :dead, :alive]
        ])
      end

      it "dies with 7 alive neighbors(overpopulation)" do
        world1 = [
          [:alive, :alive],
          [:alive, :alive, :alive],
          [:alive, :alive, :alive]
        ]
        expect(subject.tick(world1)).to eq([
          [:alive, :dead],
          [:dead, :dead, :dead],
          [:alive, :dead, :alive]
        ])
      end

      it "dies with 8 alive neighbors(overpopulation)" do
        world1 = [
          [:alive, :alive, :alive],
          [:alive, :alive, :alive],
          [:alive, :alive, :alive]
        ]
        expect(subject.tick(world1)).to eq([
          [:alive, :dead, :alive],
          [:dead, :dead, :dead],
          [:alive, :dead, :alive]
        ])
      end
    end

    context "when current cell is dead" do
      it "stays dead with 0 alive neighbors" do
        world = [[:dead]]
        expect(subject.tick(world)).to eq([[:dead]])
      end

      it "stays dead with 1 alive neighbors" do
        world = [[:alive, :dead]]
        expect(subject.tick(world)).to eq([[:dead, :dead]])
      end

      it "stays dead with 2 alive neighbors" do
        world1 = [[:alive, :dead, :alive]]
        expect(subject.tick(world1)).to eq([[:dead, :dead, :dead]])

        world2 = [[:alive],[:dead],[:alive]]
        expect(subject.tick(world2)).to eq([[:dead],[:dead],[:dead]])
      end

      it "becomes a live cell with 3 alive neighbors(reproduction)" do
        world1 = [
          [:alive, :alive],
          [:alive, :dead]
        ]
        expect(subject.tick(world1)).to eq([
          [:alive, :alive],
          [:alive, :alive]
        ])

        world2 = [
          [:alive],
          [:alive, :dead, :alive],
        ]
        expect(subject.tick(world2)).to eq([
          [:dead],
          [:dead, :alive, :dead],
        ])

        world3 = [
          [:alive, :alive],
          [:dead],
          [:alive]
        ]
        expect(subject.tick(world3)).to eq([
          [:dead, :dead],
          [:alive],
          [:dead]
        ])
      end

      it "stays dead 4 alive neighbors" do
        world1 = [
          [:alive, :alive],
          [:alive, :dead, :alive]
        ]
        expect(subject.tick(world1)).to eq([
          [:alive, :alive],
          [:alive, :dead, :dead]
        ])

        world2 = [
          [:alive, :alive],
          [:alive, :dead],
          [:alive],
        ]
        expect(subject.tick(world2)).to eq([
          [:alive, :alive],
          [:alive, :dead],
          [:dead],
        ])

        world3 = [
          [:alive],
          [:alive, :dead, :alive],
          [:alive],
        ]
        expect(subject.tick(world3)).to eq([
          [:dead],
          [:alive, :dead, :dead],
          [:dead],
        ])
      end

      it "stays dead 5 alive neighbors"
      it "stays dead 6 alive neighbors"
      it "stays dead 7 alive neighbors"
      it "stays dead 8 alive neighbors"
    end
  end
end
