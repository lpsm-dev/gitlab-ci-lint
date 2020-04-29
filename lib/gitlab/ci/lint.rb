module Gitlab
  module Ci
    module Lint
      require File.expand_path("lint/yml", File.dirname(__FILE__))
      require File.expand_path("lint/configuration", File.dirname(__FILE__))
      require File.expand_path("lint/log", File.dirname(__FILE__))
      require File.expand_path("lint/client", File.dirname(__FILE__))

      def self.check_file file
        unless file
          $stderr.puts('Error: You must specify the path to a .gitlab-ci.yml')
          return 1
        end
      end

      def self.validate gitlab_ci_config, configuration, arguments
        check_file(gitlab_ci_config)
        gitlab_ci_config = File.absolute_path(gitlab_ci_config)
        unless File.readable?(gitlab_ci_config)
          $stderr.puts("Error: Could not find file at '#{gitlab_ci_config}'")
          return 1
        end
        begin
          logger = Gitlab::Ci::Log.instance
          yml_reader = Gitlab::Ci::YMLReader.new(gitlab_ci_config)
          options = arguments.command_line_parser()
          values = yml_reader.get_content
          gitlab = values["gitlab"]

          gitlab_endpoint = options["endpoint"] ?
            options["endpoint"] : ((!gitlab["endpoint"].to_s.empty? && !gitlab["endpoint"].nil?) ?
            gitlab["endpoint"] : configuration.gitlab_endpoint)

          gitlab_token = options["token"] ?
            options["token"] : ((!gitlab["token"].to_s.empty? && !gitlab["token"].nil?) ?
            gitlab["token"] : configuration.gitlab_token)

          logger.info("Starting - 1.0.0...")

          puts "\nEndpoint: #{gitlab_endpoint}"
          puts "Token: #{gitlab_token}\n"
        rescue StandardError => e
          $stderr.puts("Invalid: #{gitlab_ci_config}")
          $stderr.puts("  * #{e}")
          return 1
        end
        $stdout.puts("OK: #{gitlab_ci_config}")
        return 0
      end
    end
  end
end
