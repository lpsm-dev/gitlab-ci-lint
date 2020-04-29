module Gitlab
  module Ci
    class System
      def check_file file, message
        unless file
          $stderr.puts("#{message}")
          return 1
        end
      end
      def check_if_file_is_readable file, message
        unless File.readable?(file)
          $stderr.puts("#{message}")
          return 1
        end
      end
    end
  end
end
