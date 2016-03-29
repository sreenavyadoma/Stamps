Feature: User Prints 1 FPO CN22 label on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: User Prints 1 FPO CN22 label on 8.5x11 - right side
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box C | 8.5x11 Right Side 1 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Details: Set Weight to 2 lbs 1 oz
    Then Details: Set Service to "Parcel Select Ground Large Package"
    Then Open Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 2, Oz 1 Origin United States, Tariff 10
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
