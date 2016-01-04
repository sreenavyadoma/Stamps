Feature:  International and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in to Orders as gc/qacc/auto39/326tsetaqcdS!

@international_data_error_x @international_failure_x
  Scenario:  Customs Form Data Error
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Ship-To to international address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | Add a new | random  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Set Order Details Ship-To Country to Australia
    Then Set International Ship-To Name to ""
    Then Set International Ship-To Name to "random"
    And Sign out