module Gitlab
  module Ci
    module Lint
      require File.expand_path("lint/reader/yml", File.dirname(__FILE__))
      require File.expand_path("lint/settings/arguments", File.dirname(__FILE__))
      require File.expand_path("lint/settings/configuration", File.dirname(__FILE__))
      require File.expand_path("lint/settings/log", File.dirname(__FILE__))
      require File.expand_path("lint/client", File.dirname(__FILE__))
    end
  end
end
