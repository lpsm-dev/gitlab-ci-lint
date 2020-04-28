require "optparse"

def program_name
  return File.basename(__FILE__)
end

def help
  string = """Command Line Helper to the Program - #{program_name()}
Usage Exemple: ruby example.rb [options]
Options:
-h    | --helper                HELPER.
-e    | --endpoint              GITLAB ENDPOINT.
-t    | --token                 GITLAB PRIVATE TOKEN.\n
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
  end.parse!
  return options
end
