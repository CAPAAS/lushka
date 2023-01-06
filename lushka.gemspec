# frozen_string_literal: true

require_relative "lib/lushka/version"

Gem::Specification.new do |spec|
  spec.name          = "lushka"
  spec.version       = Lushka::VERSION
  spec.authors       = ["Panasenkov A."]
  spec.email         = ["apanasenkov@capaa.ru"]

  spec.summary       = "Tiny mock-server with simple configuration"
  spec.homepage      = "https://lushka.ru"
  spec.license       = "CAPAAL"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "https://lushka.ru"

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
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
