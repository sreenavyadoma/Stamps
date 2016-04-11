Feature:  International and APO/FPO Printing (CN22 and CP72)

  Background:
    Given I am signed in to Orders as gc/qacc/auto39/326tsetaqcdS!

@international_data_error_x @international_failure_x
  Scenario:  Customs Form Data Error
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | Add a new | random  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then Details: Set Ship-To Country to Australia
    Then Details: Set International Ship-To Name to ""
    Then Details: Set International Ship-To Name to "random"
    Then Sign out