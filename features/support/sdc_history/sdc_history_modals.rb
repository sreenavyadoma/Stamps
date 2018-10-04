module SdcHistory
  module SdcHistoryModals

    class Refund < SdcPage

    end

    class ManagePickups < SdcPage

    end

    class SchedulePickup < SdcPage

    end

    class SchedulePickupConfirm < SdcPage
      #title, Print Scan Form, Done, x btn
    end

    class PickupError < SdcPage
      #title, Close, Learn More, x btn
    end

    class ScanForm < SdcPage
      #title, xbtn, checkbox(details), Print scan form, close
    end

    class ReprintScanForm < SdcPage
      #print scan form, print details, title, xbtn
    end

    class ScanFormError < SdcPage
      #title, xbtn, close, learn more
    end

    class ChangeCostCode < SdcPage
      #title, xbtn, save, dropdown
    end

  end
end
