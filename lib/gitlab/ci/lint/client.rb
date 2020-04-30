require "json"
require "httparty"
require "gitlab/ci/lint/yml.rb"

module GitLab
  module CI
    module Lint
      class Client
        include HTTParty

        def initialize
          @headers = { "Content-Type" => "application/json", "Private-Token" => "uNNACNQdxg1iSnieM2nG" }
        end

        def post url, content
          begin
            if content = GitLab::CI::Lint::YMLReader.new(content).get_json_content()
              body = { content: content }.to_json
              request = self.class.post(url, :body => body, :headers => @headers)
              if request.code == 200
                puts "\nSuccessful request!"
                return JSON.parse(request.body)
              else
                puts "Error - Bad Request #{request.code}"
                exit
              end
            else
              puts "\nError - No Content..."
              exit
            end
          rescue => error
            puts "\nError Post - #{error}"
          end
        end
      end

    end
  end
end
