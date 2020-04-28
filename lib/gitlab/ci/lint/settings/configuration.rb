class Configuration

  attr_reader :gitlab_ci_file, :gitlab_ci_path, :gitlab_endpoint, :gitlab_token,
              :log_file

  def initialize
    @gitlab_ci_file = ENV["GITLAB_CI_FILE"]
    @gitlab_ci_path = ENV["GITLAB_CI_PATH"]
    @gitlab_endpoint = ENV["GITLAB_ENDPOINT"]
    @gitlab_token = ENV["GITLAB_TOKEN"]
    @log_file = ENV["LOG_FILE"]
  end

  def variables
    return {
      "gitlab_ci_file" => @gitlab_ci_file,
      "gitlab_ci_path" => @gitlab_ci_path,
      "gitlab_endpoint" => @gitlab_endpoint,
      "gitlab_token" => @gitlab_token,
      "log_file" => @log_file
    }
  end

end