module SdcWebsite
  class SdcExactAddressNotFound < SdcPage
    page_object(:title) { { xpath: '//*[text()="Exact Address Not Found"]' } }
    page_object(:accept) { { xpath: '//*[text()="Accept"]' } }

    def address(index)
      value = index - 1
      xpath = "//input[@name='addrAmbig'][@value='#{value}']"
      page_object("item_description#{index}", tag: :radio) { { xpath: xpath } }
    end
  end
end