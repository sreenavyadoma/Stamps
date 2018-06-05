module SdcWebsite
  class SdcExactAddressNotFound < SdcPage
    page_object(:title) { { xpath: '//*[text()="Exact Address Not Found"]' } }
    page_object(:accept) { { xpath: '//*[text()="Accept"]' } }

    def address(num)
      page_object("item_description#{num}", tag: :radio) { { xpath: "(//td[@class='column-radio']/input)[#{num}]" } }
    end
  end
end