Feature: Print 1 single ply DPO CP72 label on 4⅛ x 6¼ roll

  Background:
    Given I am signed in to Orders

  @print_layouts_cp72_single_ply
  Scenario: Print 1 single ply DPO CP72 label on 4⅛ x 6¼ roll
    When I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To Country to United States
    Then Set Order Details Ship-To address to
      | name     | company       | street_address      | city | state | zip        | country       | phone  |  email |
      | PSG PFTE | 4⅛ x 6¼ roll | UNIT 8400 BOX 0000  | DPO  | AE    | 09498-9997 | United States | random | random |
    Then Set Order Details Weight to 3 lbs 2 oz
    Then Set Order Details Service to "Parcel Select Ground Package"
    Then Open customs form
    Then Set customs form Package Contents to "Other"
    Then Add Customs Form Item 1 - Description random, Qty 1, Price 30, Lbs 2, Oz 1 Origin United States, Tariff 10
    Then Set Customs Form I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Set Print Modal Media "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then Set Print Modal Printer to "Designer"
    Then Print Sample
    Then Print
    Then Sign out
