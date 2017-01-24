Feature: Print 1 single ply DPO CP72 label on 4⅛ x 6¼ roll

  Background:
    Given A user is signed in to Orders

  @print_layout_dpo_cp72_roll_single_ply
  Scenario: Print 1 single ply DPO CP72 label on 4⅛ x 6¼ roll
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to Domestic Address
      | name     | company       | street_address      | street_address_2| city | state | zip        | country       | phone  |  email |
      | PSG PFTE | 4⅛ x 6¼ roll | UNIT 8400 BOX 0000  |                  |DPO  | AE    | 09498-9997 | United States | random | random |
    Then On Order Details form, set Weight to 3 lb 2 oz
    Then On Order Details form, select service PSG Package
    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Other
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then In Print modal, click Print button Sample
    Then In Print modal, click Print button
    Then Sign out
