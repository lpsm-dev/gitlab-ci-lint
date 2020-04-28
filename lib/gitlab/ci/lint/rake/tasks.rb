require "rake"
require "gitlab/ci/lint"

module Gitlab::Ci::Lint::Rake

  class Tasks < ::Rake::TaskLib

    def initialize( base_dir = Dir.pwd )
      @base_dir = base_dir
      define_tasks
    end

    def define_tasks
      namespace :gitlab_ci do
        desc <<-EOM
          Validate a .gitlab-ci.yml file.

          Will check the top level of the build directory for a .gitlab-ci.yml
          file if one is not specified.
        EOM
        task :lint,[:path] do |t,args|
          args.with_defaults(:path => File.join(@base_dir, '.gitlab-ci.yml'))

          exit Gitlab::Ci::Lint.validate(args[:path])
        end
      end
    end

  end
  
end
