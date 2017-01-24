Feature: Print 1 single ply APO CP72 label on 4x6 roll

  Background:
    Given A user is signed in to Orders

  @print_layout_cp72_single_ply_apo_roll
  Scenario: Print 1 single ply APO CP72 label on 4x6 roll
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address
      | name   | company      | street_address    |street_address_2|  city | state | zip    | country       | phone  |  email |
      | PSG LP | 4x6 roll | PSC 3 BOX 4120  |                      |APO  | AE     |  09021  | United States | random | random |
    Then On Order Details form, set Weight to 2 lb 1 oz
    Then On Order Details form, select service PSG Package
    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Roll - 4" x 6" Shipping Label"
    Then In Print modal, click Print button Sample
    Then In Print modal, click Print button
    Then Sign out


