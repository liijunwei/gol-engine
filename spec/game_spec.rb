# frozen_string_literal: true

RSpec.describe GolEngine::Game do
  it "responds to #tick" do
    expect(subject).to respond_to(:tick)
  end
end
