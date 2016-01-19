Feature: Print 1 single ply FSA CP72 label on on 8.5x11 - right side

  Background:
    Given I am signed in to Orders

  @print_layouts_cp72_single_ply
  Scenario: Print 1 single ply FSA CP72 label on on 8.5x11 - right side
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to United States
    Then Set Order Details Ship-To address to
      | name | company | street_address        | city    | state | zip        | country       | phone  |  email |
      | MM   | 8.5x11  | 118 E Marine Corps Dr | Hagatna | GU    | 96910-5126 | United States | random | random |
    Then Set Order Details Weight to 1 lbs 2 oz
    Then Set Order Details Service to "Media Mail"
    Then Open customs form
    Then Set customs form Package Contents to "Other"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 25, Lbs 1, Oz 2 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Shipping Label - 8 ½" x 11" Paper"
    Then Set Print Modal Printer to "factory"
    Then Select Print Modal right-side label
    And Expect Print Modal right-side label selected
    Then Print Sample
    Then Print
    Then Sign out
