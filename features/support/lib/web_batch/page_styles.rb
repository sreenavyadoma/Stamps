module Batch
  class PageStyles < BatchObject
    def general
      GeneralStyles.new @browser
    end
  end
end