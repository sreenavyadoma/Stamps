module SdcHistory

  class HistoryDatePrinted < SdcPage
    page_object(:xxxx) { { xpath:'xxxx' } }
    page_object(:xxxx) { { xpath:'xxxx' } }
    page_object(:xxxx) { { xpath:'xxxx' } }
  end

  class HistoryEligibleFor < SdcPage
    page_object(:xxxx) { { xpath:'xxxx' } }
    page_object(:xxxx) { { xpath:'xxxx' } }
    page_object(:xxxx) { { xpath:'xxxx' } }
  end

  class HistoryStatus < SdcPage
    page_object(:xxxx) { { xpath:'xxxx' } }
    page_object(:xxxx) { { xpath:'xxxx' } }
    page_object(:xxxx) { { xpath:'xxxx' } }
  end

  class HistoryUser < SdcPage
    page_object(:xxxx) { { xpath:'xxxx' } }
    page_object(:xxxx) { { xpath:'xxxx' } }
    page_object(:xxxx) { { xpath:'xxxx' } }
  end

  module HistoryFilterPanel
    class << self
      def date_printed
        HistoryDatePrinted.new
      end

      def eligible_for
        HistoryEligibleFor.new
      end

      def status
        HistoryStatus.new
      end

      def user
        HistoryUser.new
      end
    end
  end

  #all your toolbar modals goes here
end