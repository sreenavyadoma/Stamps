module Stamps
  module Registration
      class RegHelpBlock
        attr_accessor :browser, :help_elements
        def initialize(browser, help_elements)
          @help_elements = help_elements
          @browser = browser
        end

        def size
          help_elements.size.to_s
        end

        def tooltip(*args)
          if args.length == 0
            tooltip_index = 0
          else
            tooltip_index = args[0].to_i
          end
          StampsElement.new(help_elements[tooltip_index]).text
        end
      end
  end
end
