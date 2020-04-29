require "httparty"
require "json"
require_relative "./yml.rb"

module GitLab
  module CI
    module Lint
      class Client
        def get_gitlab_ci_lint url, content
          begin
            if url.kind_of? String
                content = GitLab::CI::Lint::YMLReader.new(content).get_json_content()
                if content
                  request = HTTParty.post(url, :body => { content: content }.to_json, :headers => { "Content-Type" => "application/json" })
                  if request.code == 200
                    return JSON.parse(request.body)
                  else
                    puts "Error - Bad Request #{request.code}"
                    exit
                  end
                else
                  puts "Error - No Content..."
                  exit
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
