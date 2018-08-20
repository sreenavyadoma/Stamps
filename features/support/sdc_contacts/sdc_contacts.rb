module SdcContacts

  def loading_contacts
    klass = Class.new(SdcPage) do
      page_object(:loading) { { xpath: '//*[contains(text(), "Loading contacts...")]' } }
    end
    klass.new.loading
  end
  module_function :loading_contacts

  def verifying_account
    klass = Class.new(SdcPage) do
      page_object(:verifying_account) { {xpath: '//*[contains(text(), "Verifying")]'} }
    end
    klass.new.verifying_account
  end
  module_function :verifying_account

  def contacts_left_navigation_panel
    ContactsLeftNavigation.new
  end
  module_function :contacts_left_navigation_panel

  def contacts_filter_panel
    ContactsFilter.new
  end

  #-----Contacts Tool Bar---------
  def contacts_toolbar
    ContactsToolbar.new
  end
  module_function :contacts_toolbar

  def contacts_delete_message_box
    DeleteContactMessageBox.new
  end
  module_function :contacts_delete_message_box



  #--------Details Panel---------
  def contacts_detail
    ContactsDetailsPanel.new
  end
  module_function :contacts_detail

  def contacts_detail_toolbar_menu
    ContactsDetailsToolBarMenu.new
  end
  module_function :contacts_detail_toolbar_menu

  def contacts_name_prefix
    ContactsNamePrefix.new
  end
  module_function :contacts_name_prefix

  def contacts_country
    ContactsCountry.new
  end
  module_function :contacts_country

  def contacts_group
    ContactsGroup.new
  end
  module_function :contacts_group

  def contacts_cost_code
    ContactsCostCode.new
  end
  module_function :contacts_cost_code

  def contacts_state
    ContactsState.new
  end
  module_function :contacts_state

  def contacts_email_error
    ContactsEmailErrorMessage.new
  end
  module_function :contacts_email_error

  def contacts_column
    ContactsGridColumnBase.new
  end
  module_function :contacts_column

end
