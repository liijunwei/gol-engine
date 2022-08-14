# frozen_string_literal: true

RSpec.describe GolEngine::Game do
  it "responds to #tick" do
    expect(subject).to respond_to(:tick)
  end

  describe "#tick" do
    it "keeps dead cells with 0 alive neighbors"

    it "kills alive cells with 0 alive neighbors"

    it "keeps dead cells with 1 alive neighbors"

    it "kills alive cells with 1 alive neighbors"

    it "keeps dead cells with 2 alive neighbors"

    it "keeps alive cells with 2 alive neighbors"

    it "awakes dead cells with 3 alive neighbors"

    it "keeps alive cells with 3 alive neighbors"

    it "keeps dead cells with 4 alive neighbors"

    it "kills alive cells with 4 alive neighbors"
  end
end
