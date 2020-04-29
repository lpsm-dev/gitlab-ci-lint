module Gitlab
  module Ci
    module Lint
      require File.expand_path("lint/yml", File.dirname(__FILE__))
      require File.expand_path("lint/log", File.dirname(__FILE__))
      require File.expand_path("lint/system", File.dirname(__FILE__))
      require File.expand_path("lint/client", File.dirname(__FILE__))

      def self.validate values, configuration, options
        system = Gitlab::Ci::System.new
        system.file_exist?(values, "Error: You must specify the values.yml file")
        values = File.absolute_path(values)
        system.file_is_readable?(values, "Error: Could not find file at '#{values}'")
        yml_reader = Gitlab::Ci::YMLReader.new(values)
        content = yml_reader.get_content
        gitlab, log = content["gitlab"], content["log"]

        log_file = options["log"] ?
            options["log"] : ((!log["file"].to_s.empty? && !log["file"].nil?) ?
            log["file"] : configuration.log_file)

        logger = Gitlab::Ci::Log.instance

        gitlab_endpoint = options["endpoint"] ?
            options["endpoint"] : ((!gitlab["endpoint"].to_s.empty? && !gitlab["endpoint"].nil?) ?
            gitlab["endpoint"] : configuration.gitlab_endpoint)

        gitlab_token = options["token"] ?
            options["token"] : ((!gitlab["token"].to_s.empty? && !gitlab["token"].nil?) ?
            gitlab["token"] : configuration.gitlab_token)

        gitlab_ci_file = options["file"] ?
            options["file"] : ((!gitlab["file"].to_s.empty? && !gitlab["file"].nil?) ?
            gitlab["file"] : configuration.gitlab_ci_file)

        logger.info("Starting - 1.0.0...")

        puts "\nGitLab Endpoint: #{gitlab_endpoint}"
        puts "GitLab Token: #{gitlab_token}"
        puts "GitLab CI File: #{gitlab_ci_file}"
        puts "Log File: #{log_file}\n"

        $stdout.puts("OK: #{values}")

        client = GitLab::CI::Lint::Client.new

        result = client.gitlab_ci_lint(gitlab_endpoint, gitlab_ci_file)

        puts "#{result}"

        return 0
      end

    end
  end
end
