module SdcContacts
  class AddressBookHeader < SdcPage
    page_object(:page_title) { { xpath: '//h1[text()="Contacts"]' } }
  end

  class AddressBookFilter < SdcPage
    page_object(:search) { { xpath: '//div[contains(@class, "searchContainer sui_search")]//input' } }
  end

  class AddressBookList < SdcPage
    # address book list page objects goes here.
  end

  class AddressBookDetail < SdcPage
    # address book detail page objects goes here.
  end

  class NewVersionLink < SdcPage
    # address book detail page objects goes here.
  end

  def header
    AddressBookHeader.new
  end
  module_function :header

  def new_version_link
    NewVersionLink.new
  end
  module_function :new_version_link

  def address_book_filter
    AddressBookFilter.new
  end
  module_function :address_book_filter

  def address_book_list
    AddressBookList.new
  end
  module_function :address_book_list

  def address_book_detail
    AddressBookDetail.new
  end
  module_function :address_book_detail

end
