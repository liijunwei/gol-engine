# frozen_string_literal: true

require_relative "lib/gol_engine/version"

Gem::Specification.new do |spec|
  spec.name = "gol_engine"
  spec.version = GolEngine::VERSION
  spec.authors = ["lijunwei"]
  spec.email = ["ljw532344863@sina.com"]

  spec.summary = "A game of life engine"
  spec.description = "Practice use pet project"
  spec.homepage = "https://github.com/liijunwei/gol-engine"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/liijunwei/gol-engine"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/liijunwei/gol-engine"
  spec.metadata["changelog_uri"] = "https://github.com/liijunwei/gol-engine"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
