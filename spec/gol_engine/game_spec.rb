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
        world = [[:alive, :alive, :alive]]
        expect(subject.tick(world)).to eq([[:dead, :alive, :dead]])
      end

      it "survives with 3 alive neighbors"
      it "dies with 4 alive neighbors(overpopulation)"
      it "dies with 5 alive neighbors(overpopulation)"
      it "dies with 6 alive neighbors(overpopulation)"
      it "dies with 7 alive neighbors(overpopulation)"
      it "dies with 8 alive neighbors(overpopulation)"
    end

    context "when current cell is dead" do
      it "stays dead with 0 alive neighbors"
      it "stays dead with 1 alive neighbors"
      it "stays dead with 2 alive neighbors"
      it "becomes a live cell with 3 alive neighbors(reproduction)"
      it "stays dead 4 alive neighbors"
      it "stays dead 5 alive neighbors"
      it "stays dead 6 alive neighbors"
      it "stays dead 7 alive neighbors"
      it "stays dead 8 alive neighbors"
    end
  end
end
