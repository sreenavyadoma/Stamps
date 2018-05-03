module Stamps
  module Orders
    class SdcOrdersGrid < SdcPage
      page_object(:body, tag: :div, required: true, timeout: 30) { {xpath: '//div[starts-with(@id, "ordersGrid-")][contains(@id, "-normal-body")]'} }
    end
  end
end