Feature:  International and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in as a batch shipper gc/qacc/auto39/326tsetaqcdS!

  @international @regression @international_data_error @international_failure
  Scenario:  Customs Form Data Error
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Set Ship-To country to Australia
    Then Set International Ship-To name to ""
    Then Set International Ship-To name to "random"
    And Sign out