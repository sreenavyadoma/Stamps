module SdcNavigation
  class SignedInUser < SdcPage
    page_object(:signed_in_user, tag: :a) { {id: 'username'} }
    page_object(:sign_out_link, tag: :a) { {id: 'signOutLink'} }

  end

  class MailSignInModal < SdcPage
    page_object(:sign_in_link,required: 40) { {xpath: '//a[contains(@class, "signInLink")]'} }
    page_object(:username, tag: :text_field) { {id: 'UserNameTextBox'} }
    page_object(:password, tag: :text_field) { {id: 'PasswordTextBox'} }
    page_object(:sign_in){{id: 'signInButton'}}
    page_object(:remember_username, tag: :checkbox) { {id: 'rememberUser'} }
    page_object(:invalid_sign_in) { {xpath: '//div[contains(@id, "InvalidUsernamePasswordMsg")]//label'} }
  end

  class SdcNavigationBalance < SdcPage
    page_object(:link, tag: :a) { {xpath: '//*[text()="Balance"]/..'} }
    page_object(:buy_more, tag: :a) { {id: 'buyMorePostageLnk'} }
    page_object(:view_purchase_history, tag: :a) { {xpath: '//*[text()="View Purchase History"]'} }
    page_object(:change_payment_method, tag: :a) { {xpath: '//*[text()="Change Payment Method"]'} }

    def add_funds
      SdcNavBalanceAddFunds.new
    end

    def confirm_transaction
      SdcNavBalanceCofirmTransaction.new
    end

    def processing_purchase
      SdcNavBalanceProcessing.new
    end

    def transaction_complete
      SdcNavBalanceTransaction.new
    end
  end

  class SdcNavBalanceAddFunds < SdcPage
    page_object(:title) { {xpath: '//*[text()="Add Funds"]'} }
    page_object(:x_btn) { {xpath: '//*[contains(@id, "purchasepostagewindow")]//*[contains(@class, "sdc-icon-mobile-close-light")]'} }
    page_object(:purchase) { {xpath: '//*[text()="Purchase"]'} }

    page_object(:edit_payment_method) { {xpath: '//*[text()="Edit payment method"]'} }
    page_object(:auto_fund_account) { {xpath: '//*[text()="Auto-fund account"]'} }
    page_object(:earn_free_credit, tag: :a) { {xpath: '//*[text()="Earn free account credit"]'} }

  #   radios
  #   (name, chooser, verify, property, property_name)
    page_object(:buy_10_chooser, tag: :input) { {id: 'sdc-purchasewin-10dradio'} }
    page_object(:buy_10_verify) { {id: '//*[@id="sdc-purchasewin-10dradio"]/../span'} }

    radio(:buy_10, :buy_10_chooser, :buy_10_verify, "class", "focus")
  end

  class SdcNavBalanceCofirmTransaction < SdcPage
    page_object(:title) { {xpath: '//*[text()="Confirm Transaction"]'} }
    page_object(:confirm) { {xpath: '//*[text()="Confirm"]'} }
  end

  class SdcNavBalanceProcessing < SdcPage
    page_object(:title) { {xpath: '//*[text()="Processing Purchase"]'} }
  end

  class SdcNavBalanceTransaction < SdcPage
    page_object(:title) { {xpath: '//*[text()="Transaction Complete"]'} }
    page_object(:ok_btn) { {xpath: '//*[text()="OK"]'} }
  end

  def user_drop_down
    SignedInUser.new
  end
  module_function :user_drop_down

  def mail_sign_in_modal
    MailSignInModal.new
  end
  module_function :mail_sign_in_modal

  def balance
    SdcNavigationBalance.new
  end
  module_function :balance
end
