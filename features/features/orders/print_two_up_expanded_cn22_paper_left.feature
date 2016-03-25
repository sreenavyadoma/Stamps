Feature: User Print 1 FPO CN22 Label on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: User Print 1 FPO CN22 Label on 8.5x11 - left side
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box B | Domestic FPO 8.5x11 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Details: Set Service to "Priority Mail Regional Rate Box B"
    Then Details: Set Weight to 2 lbs 1 oz
    Then Details: Add Item 1, Qty 1, ID random, Description random
    Then Details: Add Item 2, Qty 2, ID random, Description random
    Then Details: Add Item 3, Qty 3, ID random, Description random

    Then Details: Delete Item 1
    Then Details: Delete Item 2

    Then Open Customs Form
    Then Customs Form: Set Package Contents to "Merchandise"
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Customs Form: Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Select left-side label
    Then Expect Print Modal left-side label selected
    Then Toolbar: Print
    Then Sign out
