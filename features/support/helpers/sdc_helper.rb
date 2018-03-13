module Stamps
  module SdcHelper
    class << self
=begin
      def enum(*values, &class_body)
        Class.new( Class.new(&class_body) ) do
          attr_reader :ordinal

          def initialize(ordinal,*args, &blk)
            super(*args, &blk)
            @ordinal = ordinal
          end

          values.each_with_index do |(name, *parameters), i|
            const_set(name, new(i, *parameters))
          end

          class << self
            private :new
          end
        end
      end
=end
    end
  end
end