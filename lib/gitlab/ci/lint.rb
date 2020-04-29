module Gitlab
  module Ci
    module Lint
      require File.expand_path("lint/yml", File.dirname(__FILE__))
      require File.expand_path("lint/log", File.dirname(__FILE__))
      require File.expand_path("lint/system", File.dirname(__FILE__))
      require File.expand_path("lint/client", File.dirname(__FILE__))

      def self.validate values, configuration, options
        system = GitLab::CI::Lint::System.new
        client = GitLab::CI::Lint::Client.new

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

        gitlab_ci_file = options["file"] ?
            options["file"] : ((!gitlab["file"].to_s.empty? && !gitlab["file"].nil?) ?
            gitlab["file"] : configuration.gitlab_ci_file)

        logger.info("Starting - 1.0.0...")

        result = client.get_gitlab_ci_lint(gitlab_endpoint, gitlab_ci_file)

        if result["status"] == "valid"
          puts "\nYour GitLab CI File is Okay: #{result}".colorize(:green)
        else
          puts "\nYour GitLab CI File is Invalid. Information:\n".colorize(:red)
          puts result["errors"]
        end

        return 0
      end

    end
  end
end
