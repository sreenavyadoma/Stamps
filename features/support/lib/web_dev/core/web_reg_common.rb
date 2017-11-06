module Stamps
  module Registration
    class SecurityQuestions1 < Browser::StampsModal
      attr_reader :field

      def initialize(field)
        super
      end

      def select(str)
        15.times do
          return field.txt if field.txt.include?(str)
          field
        end
      end
    end
  end
end


