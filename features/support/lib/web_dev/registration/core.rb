module Stamps
  module Registration
    ##
    # help_fields is an array
      class RegHelpBlock
        attr_accessor  :help_fields
        def initialize(help_fields)
          @help_fields = help_fields
        end

        def count
         help_fields.text.split("\n").size
         end

        #alias_method :count, :size

        def text(index)
            help_fields.text.split("\n")[index]
        end

      end
  end
end
