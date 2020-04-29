require "optparse"
require "colorize"
require "gitlab/ci/lint/version"

module GitLab
  module CI
    module Lint
      class Arguments
        attr_reader :program_name

        def initialize
          @program_name = File.basename(__FILE__).colorize(:yellow)
          @program_version = Gitlab::Ci::Lint::VERSION.colorize(:yellow)
          @options = {
            verbose: false
          }
        end

        def command_line_parser
          OptionParser.new do |opts|
            opts.banner = "Usage: example.rb [options]"
            opts.on("-h", "--helper", "Show helper documentation") { |value| @options[:help] = helper() }
            opts.on("-e", "--endpoint [GITLAB ENDPOINT]", "GitLab Endpoint") { |value| @options[:endpoint] = value }
            opts.on("-t", "--token [GITLAB TOKEN]", "GitLab Token") { |value| @options[:token] = value }
            opts.on("-f", "--file [GITLAB CI FILE]", "GitLab CI File") { |value| @options[:file] = value }
            opts.on("-v", "--values [VALUES FILE]", "Values File") { |value| @options[:values] = value }
            opts.on("-l", "--log [LOG GILE]", "Log File") { |value| @options[:log] = value }
            opts.on("--verbose", "If set, print verbose output") { |value| @options[:verbose] = true }
            opts.on("--version", "Show GitLab CI Lint Version") { |value| @options[:help] = version() }
          end.parse!
          return @options
        end

        private

        def helper
          string = """

        Command Line Helper to the Program - #{@program_name}
        Usage Exemple: ruby example.rb [options]
        Options:
        -h          | --helper                GITLAB CI LINT HELPER.
        -e          | --endpoint              GITLAB ENDPOINT.
        -t          | --token                 GITLAB TOKEN.
        -f          | --file                  GITLAB CI FILE.
        -v          | --values                GITLAB CI LINT VALUES FILE.
        -l          | --log                   GITLAB CI LINT LOG FILE.
        --verbose   |                         GITLAB CI LINT VERBOSE.
        --version   |                         GITLAB CI LINT VERSION.
        """
          puts string
          exit 1
        end

        def version
          string = """

          GitLab CI Lint Version: #{@program_version}
          """
          puts string
          exit
        end
      end
    end
  end
end
