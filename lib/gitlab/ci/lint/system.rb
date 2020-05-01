module GitLab
  module CI
    module Lint

      class System

        def file_exist? file, message
          unless file
            $stderr.puts("#{message}")
            return 1
          end
        end

        def file_is_readable? file, message
          unless File.readable?(file)
            $stderr.puts("#{message}")
            return 1
          end
        end

      end
    end
  end
end
