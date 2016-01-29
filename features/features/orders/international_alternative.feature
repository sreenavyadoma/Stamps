Feature:  International and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in to Orders as gc/qacc/auto39/326tsetaqcdS!

@international_data_error_x @international_failure_x
  Scenario:  Customs Form Data Error
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To International Adress;
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | Add a new | random  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Order Details: Set Ship-To Country to Australia
    Then Order Details: Set International Ship-To Name to ""
    Then Order Details: Set International Ship-To Name to "random"
    And Sign out