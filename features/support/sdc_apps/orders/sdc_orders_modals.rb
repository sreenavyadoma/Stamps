
module SdcOrders
  class SdcOrdersModals
    def print_modal
      page_object(:title) { {xpath: '//div[contains(@id, "printwindow")]//div[contains(text(),"You have")]'} }
      page_object(:print) { {id: 'sdc-printwin-printbtn-btnWrap'} }
    end
  end
end
