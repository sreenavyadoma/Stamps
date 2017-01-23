Feature: Print 1 single ply APO CP72 label on 4x6 roll

  Background:
    Given I am signed in to Orders

  @print_layout_cp72_single_ply_apo_roll
  Scenario: Print 1 single ply APO CP72 label on 4x6 roll
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address
      | name   | company      | street_address    |street_address_2|  city | state | zip    | country       | phone  |  email |
      | PSG LP | 4x6 roll | PSC 3 BOX 4120  |                      |APO  | AE     |  09021  | United States | random | random |
    Then Order Details: Set Weight to 2 lb 1 oz
    Then Order Details: Select Service PSG Package
    Then Order Details: Edit Customs Form
    Then Customs Form: Set Package Contents to Merchandise
    Then Customs Form: Add Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then Customs Form: Check I agree to the USPS Privacy Act Statement
    Then Customs Form: Close Customs Form
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Roll - 4" x 6" Shipping Label"
    Then Print Modal: Print Sample
    Then Print Modal: Print
    Then Sign out


