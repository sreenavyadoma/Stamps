Feature: Print 1 single ply APO CP72 label on 4x6 roll

  Background:
    Given I am signed in to Orders

  @print_layouts_cp72_single_ply_apo_roll
  Scenario: Print 1 single ply APO CP72 label on 4x6 roll
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PSG LP | 4x6 roll | PSC 3 BOX 4120  | APO  | AE     |  09021  | United States | random | random |
    Then Details: Set Weight to 2 lbs 1 oz
    Then Details: Set Service to "Parcel Select Ground Large Package"
    Then Open Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Lbs 2, Oz 1 Origin United States, Tariff 10
    Then Customs: Set I agree to Checked
    Then Close Customs Form
    Then Open Print Modal
    Then Print: Set Media "Roll - 4" x 6" Shipping Label"
    Then Print: Print Sample
    Then Toolbar: Print
    Then Sign out
