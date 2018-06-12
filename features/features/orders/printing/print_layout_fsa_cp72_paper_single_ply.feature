Feature: Print 1 single ply FSA CP72 label on on 8.5x11 - right side

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_fsa_cp72_paper_single_ply
  Scenario: Print 1 single ply FSA CP72 label on on 8.5x11 - right side
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to domestic address to
      | full_name | company | street_address        |street_address_2|  city    | state | zip        | country       | phone  |  email |
      | MM   | 8.5x11  | 118 E Marine Corps Dr |                |Hagatna | GU    | 96910-5126 | United States | random | random |
    Then set order details weight to 1 lb 2 oz
    Then set order details service to MM Package/Flat/Thick Envelope

    Then click order details form customs form button
    Then set customs package contents to Other
    Then add customs associated item 1, description random, qty 1, Price 25, Made In United States, Tariff 10
    Then set customs more info to random
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button Sample
    Then click print modal print button
    Then sign out
