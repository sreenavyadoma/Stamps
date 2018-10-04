module SdcHistory

  class HistoryDatePrinted < SdcPage
    page_object(:header) { { xpath:'xxxx' } }

    page_object(:today) { { xpath:'xxxx' } }
    page_object(:today_count) { { xpath:'xxxx' } }

    page_object(:past_7_days) { { xpath:'xxxx' } }
    page_object(:past_7_days_count) { { xpath:'xxxx' } }

    page_object(:past_30_days) { { xpath:'xxxx' } }
    page_object(:past_30_days_count) { { xpath:'xxxx' } }

    page_object(:past_3_months) { { xpath:'xxxx' } }
    page_object(:past_3_months_count) { { xpath:'xxxx' } }

    page_object(:past_6_months) { { xpath:'xxxx' } }
    page_object(:past_6_months_count) { { xpath:'xxxx' } }

    page_object(:past_12_months) { { xpath:'xxxx' } }
    page_object(:past_12_months_count) { { xpath:'xxxx' } }

    page_object(:past_2_years) { { xpath:'xxxx' } }
    page_object(:past_2_years_count) { { xpath:'xxxx' } }

    page_object(:all) { { xpath:'xxxx' } }
    page_object(:custom_date_range) { { xpath:'xxxx' } }
  end

  class HistoryEligibleFor < SdcPage
    page_object(:header) { { xpath:'xxxx' } }

    page_object(:refund) { { xpath:'xxxx' } }
    page_object(:scan_form_count) { { xpath:'xxxx' } }

    page_object(:refund) { { xpath:'xxxx' } }
    page_object(:usps_pickup_count) { { xpath:'xxxx' } }

    page_object(:insurance_claim) { { xpath:'xxxx' } }
    page_object(:insurance_claim_count) { { xpath:'xxxx' } }
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