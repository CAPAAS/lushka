# frozen_string_literal: true

require_relative "lib/lushka/version"

Gem::Specification.new do |spec|
  spec.name          = "lushka"
  spec.version       = Lushka::VERSION
  spec.authors       = ["Panasenkov A."]
  spec.email         = ["apanasenkov@capaa.ru"]

  spec.summary       = "Tiny mock-server with simple configuration"
  spec.homepage      = "https://lushka.ru"
  spec.licenses      = ["Nonstandard"]
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/capaas/lushka"
  spec.metadata["changelog_uri"] = "https://github.com/capaas/lushka/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/lushka/extconf.rb"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "rack", "~> 3.0.4.2"
  spec.add_dependency "rack-unreloader", ">= 1.8"

  spec.add_dependency "async", "~> 1.30.1"
  spec.add_dependency "async-http", "~> 0.59.2"
  spec.add_dependency "async-io", "~> 1.34.1"
  spec.add_dependency "async-sequel", "~> 0.1.0"
  spec.add_dependency "falcon", "~> 0.42.3"
  spec.add_dependency "logger", ">=1.5.3"
  spec.add_dependency "rake", "~> 13.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
