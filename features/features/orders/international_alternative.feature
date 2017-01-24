Feature:  International and APO/FPO Printing (CN22 and CP72)

  Background:
    Given A user is signed in to Orders as gc/qacc/auto39/326tsetaqcdS!

@international_data_error_x @international_failure_x
  Scenario:  Customs Form Data Error
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | Add a new | random  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then On Order Details form, set Ship-To Country to Australia
    Then On Order Details form, set International Ship-To Name to ""
    Then On Order Details form, set International Ship-To Name to "random"
    Then Sign out