Feature: Print 2 Intl CN22 labels on 5.5x8.5 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_cn22_5x8_right_print2
  Scenario: Print 2 Intl CN22 labels on 5.5x8.5 - right side
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Lg Env-Flat | 5.5x8.5 Right Side 2 | random           | random           | random | random  | random      | Croatia | random  | random  |
    Then Order Details: Select Service FCMI Large Envelope
    Then Order Details: Set Ounces to 1
    Then Order Details: Edit Customs Form
    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to International Address
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Pkg-Thick Env | 5.5x8.5 Right Side 1 | random           | random           | random | random  | random      | India | random  | random  |
    Then Order Details: Select Service FCMI Package
    Then Order Details: Set Ounces to 1
    Then Order Details: Edit Customs Form
    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Orders Grid: Check row 1
    Then Orders Grid: Check row 2
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 5 ½" x 8 ½""
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select right-side label
    Then Print Modal: Expect right-side label selected
    Then Print Modal: Print


    Then Sign out
