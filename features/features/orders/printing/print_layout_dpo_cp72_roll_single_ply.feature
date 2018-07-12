Feature: Print 1 single ply DPO CP72 label on 4⅛ x 6¼ roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_dpo_cp72_roll_single_ply
  Scenario: Print 1 single ply DPO CP72 label on 4⅛ x 6¼ roll
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details domestic ship-to country to United States
    Then set order details ship-to domestic address to
      | full_name     | company       | street_address1      | street_address2| city | state | zip        | country       | phone  |  email |
      | PSG PFTE | 4⅛ x 6¼ roll | UNIT 8400 BOX 0000  |                  |DPO  | AE    | 09498-9997 | United States | random | random |
    Then set order details weight to 3 lb 2 oz
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then click order details form customs form button
    Then set customs package contents to Other
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then click orders toolbar print button
    Then set print modal print-on to Roll 418x614
    Then click print modal print button Sample
    Then click print modal print button
    Then sign out
