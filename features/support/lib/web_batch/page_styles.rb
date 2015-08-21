module Batch
  class PageStyles < BrowserObject
    def general
      GeneralStyles.new @browser
    end
  end
end