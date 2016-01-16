Feature: User Prints 1 FPO CN22 label on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_two_up_expanded
  Scenario: User Prints 1 FPO CN22 label on 8.5x11 - right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to United States
    Then Set Order Details Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PM RR Box C | 8.5x11 Right Side 1 | PSC 473 BOX 12  | FPO  | AP     |  96349-0001  | United States | random | random |
    Then Set Order Details Weight to 2 lbs 1 oz
    Then Set Order Details Service to "Parcel Select Ground Large Package"
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 2, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    Then Expect Print Modal right-side label selected
    Then Print Sample
    Then Print
    Then Sign out
