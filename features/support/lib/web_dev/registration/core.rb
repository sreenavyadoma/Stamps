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

        def tooltip(tooltip_index)
          tooltip_index = tooltip_index.to_i
          StampsElement.new(help_elements[tooltip_index]).text
        end
      end

      class RegFieldRequiredHelpBlock
        attr_accessor :help_elements
        def initialize(help_elements)
          @help_elements = help_elements
        end

        def tooltip
          StampsElement.new(help_elements).text
        end
      end
  end
end
