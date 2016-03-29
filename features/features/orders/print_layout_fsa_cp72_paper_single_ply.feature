Feature: Print 1 single ply FSA CP72 label on on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_layout_fsa_cp72_paper_single_ply
  Scenario: Print 1 single ply FSA CP72 label on on 8.5x11 - right side
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To address to
      | name | company | street_address        | city    | state | zip        | country       | phone  |  email |
      | MM   | 8.5x11  | 118 E Marine Corps Dr | Hagatna | GU    | 96910-5126 | United States | random | random |
    Then Details: Set Weight to 1 lbs 2 oz
    Then Details: Set Service to "Media Mail"
    Then Open Customs Form
    Then Customs: Set Package Contents to "Other"
    Then Customs: Add Item 1, Description random, Qty 1, Price 25, Lbs 1, Oz 2 Origin United States, Tariff 10
    Then Customs: Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select right-side label
    Then Expect Print Modal right-side label selected
    Then Print: Print Sample
    Then Toolbar: Print
    Then Sign out
