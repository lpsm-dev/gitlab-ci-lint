require "httparty"
require "yaml"
require "json"

module GitLab
  module CI
    module Lint
      class Client

        def valid_json? json
          begin
            JSON.parse(json)
            return true
          rescue
            return false
          end
        end

        def gitlab_ci_lint url, content
          begin
            if url.kind_of? String
                content = JSON.pretty_generate(YAML.load(File.read(content)))
                if valid_json?(content)
                  request = HTTParty.post(url, :body => { content: content }.to_json, :headers => { "Content-Type" => "application/json" })
                  puts request.code, request.body
                end
            end
          rescue => error
              puts "\nError - #{error}"
          end
        end
      end
    end
  end
end
