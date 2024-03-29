require "gitlab/ci/lint"
require "gitlab/ci/lint/arguments"
require "gitlab/ci/lint/configuration"

arguments = GitLab::CI::Lint::Arguments.new
options = arguments.command_line_parser()

configuration = GitLab::CI::Lint::Configuration.new

values = options["values"] ?
  options["values"] : (configuration.values ?
  configuration.values : "values.yml")

Gitlab::Ci::Lint.validate(values, configuration, options)
