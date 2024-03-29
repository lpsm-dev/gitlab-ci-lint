module GitLab
  module CI
    module Lint

      class Serializer
        attr_reader :content

        def initialize content
          @content = content
          @sucess_message = "Your GitLab CI File is Okay.".colorize(:green)
          @failure_message = "Your GitLab CI File is Invalid.".colorize(:red)
          @serialize = serialize
        end

        def success
          puts """
Result: #{@sucess_message}

Information:

* Status: #{@serialize[:status]}
* Erros: #{@serialize[:errors]}

Yeaaaah!!!! Congrats!!!!
          """
        end

        def failure
          puts """
Result: #{@failure_message}

#{"Information".colorize(:yellow)}

* Status: #{@serialize[:status].colorize(:red)}
* Erros: #{@serialize[:errors].to_s.colorize(:red)}

Baaaaaad GitLab CI! Fuck man, you're a idiot...
          """
          puts "Error Details:\n".colorize(:yellow)
          @content["errors"].each_with_index do |value, index|
            puts "Error #{index} - #{value}"
          end
          puts
        end

        def serialize
          {
            :status => @content["status"],
            :error => @content["errors"]
          }
        end

      end
    end
  end
end
