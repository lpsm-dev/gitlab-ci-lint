require_relative "./bin/reader/yml.rb"
require_relative "./bin/settings/arguments.rb"
require_relative "./bin/settings/configuration.rb"

if __FILE__ == $0
  configuration = Configuration.new
  yml_reader = ReaderYMLFile.new("values.yml")
  options = command_line_parser()

  values = yml_reader.get_content
  gitlab = values["gitlab"]

  gitlab_endpoint = options["endpoint"] ?
    options["endpoint"] : ((!gitlab["endpoint"].to_s.empty? && !gitlab["endpoint"].nil?) ?
    gitlab["endpoint"] : configuration.gitlab_endpoint)

  gitlab_token = options["token"] ?
    options["token"] : ((!gitlab["token"].to_s.empty? && !gitlab["token"].nil?) ?
    gitlab["token"] : configuration.gitlab_token)

  puts "\nEndpoint: #{gitlab_endpoint}"
  puts "Token: #{gitlab_token}\n"
end
