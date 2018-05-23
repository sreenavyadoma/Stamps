Feature: Print 1 single ply APO CP72 label on 4x6 roll

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72_single_ply_apo_roll
  Scenario: Print 1 single ply APO CP72 label on 4x6 roll
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to domestic address to
      | full_name   | company      | street_address    |street_address_2|  city | state | zip    | country       | phone  |  email |
      | PSG LP | 4x6 roll | PSC 3 BOX 4120  |                      |APO  | AE     |  09021  | United States | random | random |
    Then set order details weight to 2 lb 1 oz
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Merchandise
    Then add Customs Associated Item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click orders toolbar print button
    Then set print modal print-on to Roll - 4" x 6" Shipping Label
    Then click print modal print button Sample
    Then click print modal print button
    Then sign out


