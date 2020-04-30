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
        Usage Exemple: ruby example.rb [global options] [command [command options]] [PATH]

        Global options:
        -h          | --helper                show GitLab CI help.
        -e          | --endpoint              root URL of the GitLab instance to use API (default: 'https://gitlab.com')
        -f          | --file                  FILE is the relative or absolute path to the gitlab-ci file
        -d          | --directory             DIR is the directory from where to search for gitlab-ci file and git repository (default: '.')
        -t          | --timeout               timeout in second after which http request to GitLab API will timeout (and the program will fails) (default: 5)
        -n          | --no-color              don't color output. By defaults the output is colorized if a compatible terminal is detected.
        -v          | --values                Values file with information.
        -l          | --log                   LOG is the log file path.
        -v          | --verbose               verbose mode.
        -V          | --version               print the version information.
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
