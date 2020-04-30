require "gitlab/ci/lint/yml"
require "gitlab/ci/lint/log"
require "gitlab/ci/lint/system"
require "gitlab/ci/lint/actions"

module Gitlab
  module Ci
    module Lint
      def self.validate values, configuration, options
        system = GitLab::CI::Lint::System.new
        actions = GitLab::CI::Lint::Actions.new

        system.file_exist?(values, "Error: You must specify the values.yml file")

        values = File.absolute_path(values)

        system.file_is_readable?(values, "Error: Could not find file at '#{values}'")

        yml_reader = GitLab::CI::Lint::YMLReader.new(values)
        content = yml_reader.get_content

        gitlab = content["gitlab"]

        logger = GitLab::CI::Lint::Log.instance

        gitlab_endpoint = options["endpoint"] ?
            options["endpoint"] : ((!gitlab["endpoint"].to_s.empty? && !gitlab["endpoint"].nil?) ?
            gitlab["endpoint"] : configuration.gitlab_endpoint)

        gitlab_token = options["token"] ?
            options["token"] : ((!gitlab["token"].to_s.empty? && !gitlab["token"].nil?) ?
            gitlab["token"] : configuration.gitlab_token)

        timeout = options["timeout"] ?
            options["timeout"] : ((!gitlab["timeout"].to_s.empty? && !gitlab["timeout"].nil?) ?
            gitlab["timeout"] : configuration.timeout)

        gitlab_ci_file = options["file"] ?
            options["file"] : ((!gitlab["file"].to_s.empty? && !gitlab["file"].nil?) ?
            gitlab["file"] : configuration.gitlab_ci_file)

        logger.info("Starting GitLab CI YML Validation...")

        headers = gitlab_token ? { "Content-Type" => "application/json", "Private-Token" => gitlab_token } : { "Content-Type" => "application/json"}

        actions.validate_gitlab_ci_yml(gitlab_endpoint, gitlab_ci_file, headers, timeout)

        return 0
      end

    end
  end
end
