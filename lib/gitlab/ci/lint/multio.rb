module GitLab
  module CI
    module Lint
      class MultiIO
        def initialize(*targets)
          @targets = targets
        end

        def write(*args)
          @targets.each {|target| target.write(*args)}
        end

        def close
          @targets.each(&:close)
        end
      end
    end
  end
end
