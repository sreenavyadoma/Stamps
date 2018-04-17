module Stamps
  module SdcOrders
    class SdcOrdersModals
      def print_modal
        page_obj(:title) { {xpath: '//div[contains(@id, "printwindow")]//div[contains(text(),"You have")]'} }
        page_obj(:print) { {id: 'sdc-printwin-printbtn-btnWrap'} }
      end
    end
  end
end