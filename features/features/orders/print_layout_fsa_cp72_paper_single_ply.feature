Feature: Print 1 single ply FSA CP72 label on on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_layout_fsa_cp72_paper_single_ply
  Scenario: Print 1 single ply FSA CP72 label on on 8.5x11 - right side
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Domestic Address
      | name | company | street_address        |street_address_2|  city    | state | zip        | country       | phone  |  email |
      | MM   | 8.5x11  | 118 E Marine Corps Dr |                |Hagatna | GU    | 96910-5126 | United States | random | random |
    Then Details: Set Weight to 1 lb 2 oz
    Then Details: Select Service MM Package

    Then Customs: Open Modal
    Then Customs: Set Package Contents to Other
    Then Customs: Add Item 1, Description random, Qty 1, Price 25, Origin United States, Tariff 10
    Then Customs: Set More Info to "random"
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal

    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select right-side label
    Then Print: Expect right-side label selected
    Then Print: Print Sample
    Then Print: Print
    Then Sign out
