Feature: Print 1 single ply FSA CP72 label on on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_layout_fsa_cp72_paper_single_ply
  Scenario: Print 1 single ply FSA CP72 label on on 8.5x11 - right side
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address
      | name | company | street_address        |street_address_2|  city    | state | zip        | country       | phone  |  email |
      | MM   | 8.5x11  | 118 E Marine Corps Dr |                |Hagatna | GU    | 96910-5126 | United States | random | random |
    Then Order Details: Set Weight to 1 lb 2 oz
    Then Order Details: Select Service MM Package

    Then Customs Form: Open Modal
    Then Customs Form: Set Package Contents to Other
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 25, Origin United States, Tariff 10
    Then Customs Form: Set More Info to "random"
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
