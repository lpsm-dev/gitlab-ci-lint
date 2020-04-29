require "yaml"

module Gitlab
  module Ci
    class YMLReader
      attr_reader :file
      def initialize file
        @file = file
      end

      def get_content
        begin
          return eval(YAML.load_file(@file).inspect)
        rescue ArgumentError => error
          puts "Could not parse the YAML File: #{error.message}"
        end
      end
    end
  end
end
