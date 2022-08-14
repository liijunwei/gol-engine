# frozen_string_literal: true

RSpec.describe GolEngine::Game do
  it "responds to #tick" do
    expect(subject).to respond_to(:tick)
  end

  describe "#tick" do
    context "when current cell is alive" do
      it "dies with 0 alive neighbors(underpopulation)" do
        world = [
                  [:dead, :dead,  :dead],
                  [:dead, :alive, :dead],
                  [:dead, :dead,  :dead]
                ]
        expect(subject.tick(world)[1][1]).to eq(:dead)
      end

      it "dies with 1 alive neighbors(underpopulation)" do
        world1 = [
                   [:dead, :dead,  :dead],
                   [:alive, :alive, :dead],
                   [:dead, :dead,  :dead]
                 ]
        expect(subject.tick(world1)[1][1]).to eq(:dead)

        world2 = [
                   [:alive, :dead,  :dead],
                   [:dead, :alive, :dead],
                   [:dead, :dead,  :dead]
                 ]
        expect(subject.tick(world2)[1][1]).to eq(:dead)

        world3 = [
                   [:dead, :alive,  :dead],
                   [:dead, :alive, :dead],
                   [:dead, :dead,  :dead]
                 ]
        expect(subject.tick(world3)[1][1]).to eq(:dead)

        world4 = [
                   [:dead, :dead,  :alive],
                   [:dead, :alive, :dead],
                   [:dead, :dead,  :dead]
                 ]
        expect(subject.tick(world4)[1][1]).to eq(:dead)

        world5 = [
                   [:dead, :dead,  :dead],
                   [:dead, :alive, :alive],
                   [:dead, :dead,  :dead]
                 ]
        expect(subject.tick(world5)[1][1]).to eq(:dead)

        world6 = [
                   [:dead, :dead,  :dead],
                   [:dead, :alive, :dead],
                   [:dead, :dead,  :alive]
                 ]
        expect(subject.tick(world6)[1][1]).to eq(:dead)

        world7 = [
                   [:dead, :dead,  :dead],
                   [:dead, :alive, :dead],
                   [:dead, :alive,  :dead]
                 ]
        expect(subject.tick(world7)[1][1]).to eq(:dead)

        world8 = [
                   [:dead, :dead,  :dead],
                   [:dead, :alive, :dead],
                   [:alive, :dead,  :dead]
                 ]
        expect(subject.tick(world8)[1][1]).to eq(:dead)
      end

      it "survives with 2 alive neighbors"
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
