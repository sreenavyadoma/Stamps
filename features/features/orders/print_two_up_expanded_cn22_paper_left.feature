Feature: User Print 1 FPO CN22 Label on 8.5x11 - left side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: User Print 1 FPO CN22 Label on 8.5x11 - left side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to United States
    Then Set Order Details Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box B | Domestic FPO 8.5x11 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set Order Details Service to "Priority Mail Regional Rate Box B"
    Then Set Order Details Weight to 2 lbs 1 oz
    Then Add Order Details Item 1 - Qty 1, ID random, Description random
    Then Add Order Details Item 2 - Qty 2, ID random, Description random
    Then Add Order Details Item 3 - Qty 3, ID random, Description random

    Then Delete Order Details Item 1
    Then Delete Order Details Item 2

    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 0, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal left-side label
    Then Expect Print Modal left-side label selected
    Then Expect Print Window Requires 1 label sheets
    Then Print
    Then Sign out
