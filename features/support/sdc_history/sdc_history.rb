module SdcHistory

  class << self
    def toolbar
      SdcHistoryToolbar.new
    end

    def filter_panel
      HistoryFilterPanel
    end
  end
end