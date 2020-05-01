require "yaml"
require "json"

module GitLab
  module CI
    module Lint

      class YMLReader
        attr_reader :file

        def initialize file
          @file = File.join(File.dirname(__FILE__), file)
          validate!
        end

        def validate!
          # Check that file is defined
          raise NotDefinedError unless @file
          # Check if is a YML extesion
          raise ArgumentError unless @file.chars.last(4).join == ".yml" or @file.chars.last(5).join == ".yaml"
          # Check that the config file is exist?
          raise FileNotFoundException unless ::File.exist?(@file)
          # Check that the config file is readable?
          raise NotReadableError unless ::File.readable?(@file)
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
