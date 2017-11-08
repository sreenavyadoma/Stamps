module Stamps
  module Registration
      class RegHelpBlock
        attr_accessor :browser, :help_fields
        def initialize(browser, help_fields)
          @help_fields=help_fields
          @browser=browser
        end

        def size
          help_fields.size.to_s
        end

        def tooltip(*args)
          if args.length==0
            tooltip_index=0
          else
            tooltip_index=args[0].to_i
          end
          StampsField.new(help_fields[tooltip_index]).text
        end
      end
  end
end
