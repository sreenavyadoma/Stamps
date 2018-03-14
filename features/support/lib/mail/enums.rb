module Stamps
  module Mail
=begin
    PrintMediaEnum = SdcHelper.enum(['Stamps 1'], ['ShippingLabel 2'], ['Enveloper 3'], ['CertifiedMail 4'], ['Roll 5']) do
      attr_reader :str
      def initialize(str)
        @str = str
    end unless Object.const_defined?('PrintMediaEnum')
    end
=end
  end
end