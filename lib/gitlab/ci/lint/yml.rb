require "yaml"
require "json"

module GitLab
  module CI
    module Lint
      class YMLReader
        attr_reader :file
        def initialize file
          @file = file
        end

        def get_content
          begin
            return YAML.load(File.read(@file))
          rescue ArgumentError => error
            puts "Could not parse the YAML File: #{error.message}"
          end
        end

        def get_json_content
          content = JSON.pretty_generate(get_content())
          return valid_json?(content) ? content : nil
        end

        private

        def valid_json? json
          begin
            JSON.parse(json)
            return true
          rescue
            return false
          end
        end

      end
    end
  end
end
