module SdcHistory
  class SdcHistoryToolbar < SdcPage

  end
  class << self
    def toolbar
      SdcHistoryToolbar.new
    end
  end
end