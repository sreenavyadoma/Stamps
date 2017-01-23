Feature: User Prints 1 FPO CN22 label on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded_fpo_cn22_paper_right
  Scenario: User Prints 1 FPO CN22 label on 8.5x11 - right side
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box C | 8.5x11 Right Side 1 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Order Details: Set Weight to 2 lb 1 oz
    Then Order Details: Select Service PSG Package
    Then Order Details: Edit Customs Form
    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select right-side label
    Then Print Modal: Expect right-side label selected
    Then Print Modal: Print Sample
    Then Print Modal: Print
    Then Sign out
