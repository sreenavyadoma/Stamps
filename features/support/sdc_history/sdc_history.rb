module SdcHistory

  class << self
    def toolbar
      SdcHistoryToolbar.new
    end

    def filter_panel
      SdcHistoryFilterPanel.new
    end
  end
end