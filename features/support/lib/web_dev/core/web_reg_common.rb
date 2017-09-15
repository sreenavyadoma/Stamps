module Stamps
  module Registration
    class SecurityQuestions1 < Browser::StampsModal
      attr_reader :element

      def initialize(element)
        super
      end

      def select(str)
        15.times do
          return element.txt if element.txt.include?(str)
          element
        end
      end
    end
  end
end


