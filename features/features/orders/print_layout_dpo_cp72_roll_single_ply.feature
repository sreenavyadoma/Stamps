Feature: Print 1 single ply DPO CP72 label on 4⅛ x 6¼ roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_dpo_cp72_roll_single_ply
  Scenario: Print 1 single ply DPO CP72 label on 4⅛ x 6¼ roll
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to Domestic Address
      | name     | company       | street_address      | street_address_2| city | state | zip        | country       | phone  |  email |
      | PSG PFTE | 4⅛ x 6¼ roll | UNIT 8400 BOX 0000  |                  |DPO  | AE    | 09498-9997 | United States | random | random |
    Then on Order Details form, set Weight to 3 lb 2 oz
    Then on Order Details form, select service PSG Package
    Then on Order Details form, click Edit Form button
    Then on Customs form, set Package Contents to Other
    Then on Customs form, add Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then on Customs form, click Close button
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then in Print modal, click Print button Sample
    Then in Print modal, click Print button
    Then Sign out
