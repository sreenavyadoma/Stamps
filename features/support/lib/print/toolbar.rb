module Print
  class Toolbar < Print::Postage::PrintObject
    def settings
      StampsButton.new (@browser.span :css => "span[style*='settings.png']")
    end

    def reset
      StampsButton.new (@browser.span :css => "span[style*='reset.png']")
    end

    def help
      StampsButton.new (@browser.span :css => "span[style*='help.png']")
    end

    def feedback
      StampsButton.new (@browser.span :css => "span[style*='feedback.png']")
    end

    def classic
      StampsButton.new (@browser.span :css => "span[style*='classic.png']")
    end

  end
end