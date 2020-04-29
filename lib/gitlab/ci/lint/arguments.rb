require "optparse"

module Gitlab
  module Ci
    class Arguments
      attr_reader :program_name

      def initialize
        @program_name = File.basename(__FILE__)
      end

      def help
        string = """Command Line Helper to the Program - #{@program_name}
      Usage Exemple: ruby example.rb [options]
      Options:
      -h    | --helper                HELPER.
      -e    | --endpoint              GITLAB ENDPOINT.
      -t    | --token                 GITLAB PRIVATE TOKEN.
      -f    | --file                  GITLAB CI FILE.
      -v    | --values                VALUES FILE.
      -l    | --log                   LOG FILE.\n
      """
        return puts string
      end

      def command_line_parser
        options = {}
        OptionParser.new do |opts|
          opts.banner = "Usage: example.rb [options]"
          opts.on("-h", "--helper") { |value| help() }
          opts.on("-e", "--endpoint GITLAB ENDPOINT", "GitLab Endpoint") { |value| options["endpoint"] = value }
          opts.on("-t", "--token GITLAB PRIVATE TOKEN", "GitLab Private Token") { |value| options["token"] = value }
          opts.on("-f", "--token GITLAB CI FILE", "GitLab CI File") { |value| options["file"] = value }
          opts.on("-v", "--token VALUES FILE", "Values File") { |value| options["values"] = value }
          opts.on("-l", "--token LOG GILE", "Log File") { |value| options["log"] = value }
        end.parse!
        return options
      end
    end
  end
end
