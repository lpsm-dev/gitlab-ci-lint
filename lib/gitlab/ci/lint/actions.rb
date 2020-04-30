require "gitlab/ci/lint/client"
require "gitlab/ci/lint/serializer"

module GitLab
  module CI
    module Lint
      class Actions < GitLab::CI::Lint::Client
        def validate_gitlab_ci_yml url, content
          result = post(url, content)
          message = GitLab::CI::Lint::Serializer.new(result)
          if result["status"] == "valid"
            message.success()
          else
            message.failure()
          end
        end
      end
    end
  end
end
