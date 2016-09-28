Feature: Print 1 single ply APO CP72 label on 4x6 roll

  Background:
    Given I am signed in to Orders

  @print_layout_cp72_single_ply_apo_roll
  Scenario: Print 1 single ply APO CP72 label on 4x6 roll
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To Country to United States
    Then Details: Set Ship-To address to
      | name   | company      | street_address    | city | state | zip    | country       | phone  |  email |
      | PSG LP | 4x6 roll | PSC 3 BOX 4120  | APO  | AE     |  09021  | United States | random | random |
    Then Details: Set Weight to 2 lbs 1 oz
    Then Details: Select Service Parcel Select Ground Package/Flat/Thick Envelope
    Then Details: Edit Customs Form
    Then Customs: Set Package Contents to "Merchandise"
    Then Customs: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs: Check I agree to the USPS Privacy Act Statement
    Then Customs: Close Modal
    Then Print: Open Modal
    Then Print: Set Printing On "Roll - 4" x 6" Shipping Label"
    Then Print: Print Sample
    Then Print: Print
    Then Sign out


