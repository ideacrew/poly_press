require_relative 'lib/poly_press/version'

Gem::Specification.new do |spec|
  spec.name          = "poly_press"
  spec.version       = PolyPress::VERSION
  spec.authors       = ["Dan Thomas"]
  spec.email         = ["info@ideacrew.com"]

  spec.summary       = %q{Engine for generating template-based output in common formats for volumes both small and large}
  spec.description   = %q{Engine for generating template-based output in common formats for volumes both small and large}
  spec.homepage      = "https://github.com/ideacrew/poly_press.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"]     = spec.homepage
  spec.metadata["source_code_uri"]  = "https://github.com/ideacrew/poly_press.git"
  spec.metadata["changelog_uri"]    = "https://github.com/ideacrew/poly_press/blob/master/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'i18n',                       '~> 1.6'
  spec.add_dependency 'dry-validation',             '~> 1.2'
  spec.add_dependency 'dry-struct',                 '~> 1.0'
  spec.add_dependency 'dry-monads',                 '~> 1.2'
  spec.add_dependency 'dry-matcher',                '~> 0.7'
  spec.add_dependency 'rubyXL',                     '~> 3.4', '>= 3.4.14'
  
  # spec.add_dependency 'rails',                      '>= 6.0'

  spec.add_development_dependency "bundler",        "~> 2.0"
end
