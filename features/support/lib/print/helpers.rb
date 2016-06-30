module Stamps
  module Print
    module Postage
      class PrintObject < Browser::Modal
      end
    end

    class PostageHelper
      include Singleton
      include DataMagic

    end
  end
end