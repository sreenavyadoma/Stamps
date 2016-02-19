Feature: Print 1 single ply FSA CP72 label on on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_layouts_cp72_single_ply
  Scenario: Print 1 single ply FSA CP72 label on on 8.5x11 - right side
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To Country to United States
    Then Order Details: Set Ship-To address to
      | name | company | street_address        | city    | state | zip        | country       | phone  |  email |
      | MM   | 8.5x11  | 118 E Marine Corps Dr | Hagatna | GU    | 96910-5126 | United States | random | random |
    Then Order Details: Set Weight to 1 lbs 2 oz
    Then Order Details: Set Service to "Media Mail"
    Then Open Customs Form
    Then Customs Form: Set Package Contents to "Other"
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 25, Lbs 1, Oz 2 Origin United States, Tariff 10
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print Modal: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Select right-side label
    Then Expect Print Modal right-side label selected
    Then Print Modal: Print Sample
    Then Toolbar: Print
    Then Sign out
