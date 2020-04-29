require "logger"
require "singleton"
require "gitlab/ci/lint/multio.rb"
require "gitlab/ci/lint/colors.rb"

module GitLab
  module CI
    module Lint
      class Log < GitLab::CI::Lint::Colors
        include Singleton
        attr_accessor :logger
        def initialize log_file="./file.log"
          @logger = Logger.new GitLab::CI::Lint::MultiIO.new(STDOUT,
            File.open(File.exist?(log_file) ? log_file : "./file.log", "a"))

          @logger.level = Logger::INFO

          @logger.formatter = proc do |severity, datetime, progname, msg|
            datetime = "[#{datetime.strftime('%Y-%m-%d %H:%M:%S')}]"
            case severity
              when "INFO"
                colorized_severity = self.class.colorize("#{severity}", "black", "green")
                self.class.colorize("#{colorized_severity} - #{datetime} - #{msg}\n", "black", "green")
              when "ERROR"
                colorized_severity = self.class.colorize("#{severity}", "black", "red")
                "#{colorized_severity} - #{datetime} - #{msg}\n"
            end
          end
        end

        def set_level level
          @logger.level = level
        end

        def info message, color=:green
          @logger.info(message)
        end

        def debug  message, color=:green
          @logger.debug(message)
        end

        def error message, color=:green
          @logger.error(message)
        end

        def warn message
          @logger.warn(message)
        end
      end
    end
  end
end
