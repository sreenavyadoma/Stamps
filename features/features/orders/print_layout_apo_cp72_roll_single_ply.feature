Feature: Print 1 single ply APO CP72 label on 4x6 roll

  Background:
    Given I am signed in to Orders

  @print_layouts_cp72_single_ply
  Scenario: Print 1 single ply APO CP72 label on 4x6 roll
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to United States
    Then Set Order Details Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PSG LP | 4x6 roll | PSC 3 BOX 4120  | APO  | AE     |  09021  | United States | random | random |
    Then Set Order Details Weight to 2 lbs 1 oz
    Then Set Order Details Service to "Parcel Select Ground Large Package"
    Then Open customs form
    Then Set customs form Package Contents to "Merchandise"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 2, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Roll - 4" x 6" Shipping Label"
    Then Set Print Modal Printer to "Designer"
    Then Print Sample
    Then Print
    Then Sign out
