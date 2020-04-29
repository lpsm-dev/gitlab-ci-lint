module GitLab
  module CI
    module Lint
      class Configuration
        attr_reader :gitlab_endpoint, :gitlab_token, :gitlab_ci_file,
                    :values, :log_file
        def initialize
          @gitlab_endpoint = ENV["GITLAB_ENDPOINT"]
          @gitlab_token = ENV["GITLAB_TOKEN"]
          @gitlab_ci_file = ENV["GITLAB_CI_FILE"]
          @values = ENV["VALUES"]
          @log_file = ENV["LOG_FILE"]
        end

        def variables
          return {
            "gitlab_endpoint" => @gitlab_endpoint,
            "gitlab_token" => @gitlab_token,
            "gitlab_ci_file" => @gitlab_ci_file,
            "values" => @values,
            "log_file" => @log_file
          }
        end
      end
    end
  end
end
