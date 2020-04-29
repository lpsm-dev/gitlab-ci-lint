# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gitlab/ci/lint/version"

Gem::Specification.new do |spec|
  spec.name           = "gitlab-ci-lint"
  spec.version        = Gitlab::Ci::Lint::VERSION
  spec.platform       = Gem::Platform::RUBY
  spec.authors        = ["Lucca Pessoa da Silva Matos"]
  spec.email          = "luccapsm@gmail.com"
  spec.summary        = %q{Validate your gitlab-ci.yml files}
  spec.description    = "Gitlab CI Lint"
  spec.homepage       = "https://github.com/lpmatos/gitlab-ci-lint"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  all_files = `git ls-files`.split("\n")
  test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.files         = all_files - test_files
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.bindir        = "bin"
  spec.require_paths = ["lib"]
  spec.license       = 'MIT'
  spec.add_development_dependency "httparty", "~> 0.18.0"
  spec.add_development_dependency "OptionParser", "~> 0.5.1"
  spec.add_development_dependency "yaml", "~> 0.1.0"
  spec.add_development_dependency "colorize", "~> 0.8.1"
end
