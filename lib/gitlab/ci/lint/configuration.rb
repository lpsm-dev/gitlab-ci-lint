module Gitlab
  module Ci
    class Configuration
      attr_reader :gitlab_endpoint, :gitlab_token, :gitlab_ci_file,
                  :values_file, :log_file

      def initialize
        @gitlab_endpoint = ENV["GITLAB_ENDPOINT"]
        @gitlab_token = ENV["GITLAB_TOKEN"]
        @gitlab_ci_file = ENV["GITLAB_CI_FILE"]
        @values_file = ENV["VALUES_FILE"]
        @log_file = ENV["LOG_FILE"]
      end

      def variables
        return {
          "gitlab_endpoint" => @gitlab_endpoint,
          "gitlab_token" => @gitlab_token,
          "gitlab_ci_file" => @gitlab_ci_file,
          "values_file" => @values_file,
          "log_file" => @log_file
        }
      end
    end
  end
end
