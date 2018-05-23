Feature: Print 1 Intl CP72 label

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72
  Scenario: Print 1 Intl CP72 label

    #print_layout_cp72_4x6roll
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | France | random  | random  |
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Merchandise
    Then add Customs Associated Item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click orders toolbar print button
    Then set print modal print-on to Roll - 4 x 6
    Then click print modal print button

    #print_layout_cp72_5x8_left
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 5.5x8.5  | random           | random           | random | random  | random      | Chile | random  | random  |
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details ounces to 1

    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Merchandise
    Then add Customs Associated Item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then set Customs ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

   #print_layout_cp72_5x8_right
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name              | company   | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFR Envelope |  5.5x8.5 Right Side 1  | random       | random           | random | random  | random      | Argentina | random  | random  |
    Then set order details service to PMEI Padded Flat Rate Envelope
    Then set order details ounces to 1
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Merchandise
    Then add Customs Associated Item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

    #print_layout_cp72_5x8_single_ply
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFRB |  5.5x8.5 Left Side | random       | random           | random | random  | random      | Australia | random  | random  |
    Then set order details service to PMI Large Flat Rate Box
    Then set order details ounces to 1
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Gift
    Then add Customs Associated Item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

   #print_layout_cp72_paper_continuation
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFTE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
    Then set order details service to PMI Flat Rate Envelope
    Then set order details weight to 1 lb 14 oz
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Merchandise
    Then add Customs Associated Item 1, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 2, description random, qty 1, Price 1, Made In United States, Tariff 2
    Then add Customs Associated Item 3, description random, qty 1, Price 1, Made In United States, Tariff 3
    Then add Customs Associated Item 4, description random, qty 1, Price 1, Made In United States, Tariff 4
    Then add Customs Associated Item 5, description random, qty 1, Price 1, Made In United States, Tariff 5
    Then add Customs Associated Item 6, description random, qty 1, Price 1, Made In United States, Tariff 6
    Then add Customs Associated Item 7, description random, qty 1, Price 1, Made In United States, Tariff 7
    Then add Customs Associated Item 8, description random, qty 1, Price 1, Made In United States, Tariff 8
    Then add Customs Associated Item 9, description random, qty 1, Price 1, Made In United States, Tariff 9
    Then add Customs Associated Item 10, description random, qty 1, Price 1, Made In United States, Tariff 10
    Then add Customs Associated Item 11, description random, qty 1, Price 1, Made In United States, Tariff 11
    Then add Customs Associated Item 12, description random, qty 1, Price 1, Made In United States, Tariff 12
    Then add Customs Associated Item 13, description random, qty 1, Price 1, Made In United States, Tariff 13
    Then add Customs Associated Item 14, description random, qty 1, Price 1, Made In United States, Tariff 14
    Then add Customs Associated Item 15, description random, qty 1, Price 1, Made In United States, Tariff 15
    Then add Customs Associated Item 16, description random, qty 1, Price 1, Made In United States, Tariff 16
    Then add Customs Associated Item 17, description random, qty 1, Price 1, Made In United States, Tariff 17
    Then add Customs Associated Item 18, description random, qty 1, Price 1, Made In United States, Tariff 18
    Then add Customs Associated Item 19, description random, qty 1, Price 1, Made In United States, Tariff 19
    Then add Customs Associated Item 20, description random, qty 1, Price 1, Made In United States, Tariff 20
    Then add Customs Associated Item 21, description random, qty 1, Price 1, Made In United States, Tariff 21
    Then add Customs Associated Item 22, description random, qty 1, Price 1, Made In United States, Tariff 22
    Then add Customs Associated Item 23, description random, qty 1, Price 1, Made In United States, Tariff 23
    Then add Customs Associated Item 24, description random, qty 1, Price 1, Made In United States, Tariff 24
    Then add Customs Associated Item 25, description random, qty 1, Price 1, Made In United States, Tariff 25
    Then add Customs Associated Item 26, description random, qty 1, Price 1, Made In United States, Tariff 26
    Then add Customs Associated Item 27, description random, qty 1, Price 1, Made In United States, Tariff 27
    Then add Customs Associated Item 28, description random, qty 1, Price 1, Made In United States, Tariff 28
    Then add Customs Associated Item 29, description random, qty 1, Price 1, Made In United States, Tariff 29
    Then add Customs Associated Item 30, description random, qty 1, Price 1, Made In United States, Tariff 30
    Then pause for 2 seconds
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then pause for 2 seconds
    Then close Customs Information form
    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

   #print_layout_cp72_paper_single_ply
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFRE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Document
    Then add Customs Associated Item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    
    Then click print modal print button

   #print_layout_cp72_roll_continuation
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name     | company   | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | PMI LFRB |  4x6 Roll | random           | random           | random | random  | random      | Italy   | random  | random  |
    Then set order details service to PMI Large Flat Rate Box
    Then set order details weight to 2 lb 0 oz
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Merchandise
    Then add Customs Associated Item 1, description random, qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs Associated Item 2, description random, qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs Associated Item 3, description random, qty 1, Price 3, Made In United States, Tariff 3
    Then add Customs Associated Item 4, description random, qty 1, Price 4, Made In United States, Tariff 4
    Then add Customs Associated Item 5, description random, qty 1, Price 5, Made In United States, Tariff 5
    Then add Customs Associated Item 6, description random, qty 1, Price 6, Made In United States, Tariff 6
    Then add Customs Associated Item 7, description random, qty 1, Price 7, Made In United States, Tariff 7
    Then add Customs Associated Item 8, description random, qty 1, Price 8, Made In United States, Tariff 8
    Then add Customs Associated Item 9, description random, qty 1, Price 9, Made In United States, Tariff 9
    Then add Customs Associated Item 10, description random, qty 1, Price 10, Made In United States, Tariff 10
    Then add Customs Associated Item 11, description random, qty 1, Price 11, Made In United States, Tariff 11
    Then add Customs Associated Item 12, description random, qty 1, Price 12, Made In United States, Tariff 12
    Then add Customs Associated Item 13, description random, qty 1, Price 13, Made In United States, Tariff 13
    Then add Customs Associated Item 14, description random, qty 1, Price 14, Made In United States, Tariff 14
    Then add Customs Associated Item 15, description random, qty 1, Price 15, Made In United States, Tariff 15
    Then add Customs Associated Item 16, description random, qty 1, Price 16, Made In United States, Tariff 16
    Then add Customs Associated Item 17, description random, qty 1, Price 17, Made In United States, Tariff 17
    Then add Customs Associated Item 18, description random, qty 1, Price 18, Made In United States, Tariff 18
    Then add Customs Associated Item 19, description random, qty 1, Price 19, Made In United States, Tariff 19
    Then add Customs Associated Item 20, description random, qty 1, Price 20, Made In United States, Tariff 20
    Then add Customs Associated Item 21, description random, qty 1, Price 21, Made In United States, Tariff 21
    Then add Customs Associated Item 22, description random, qty 1, Price 22, Made In United States, Tariff 22
    Then add Customs Associated Item 23, description random, qty 1, Price 23, Made In United States, Tariff 23
    Then add Customs Associated Item 24, description random, qty 1, Price 24, Made In United States, Tariff 24
    Then add Customs Associated Item 25, description random, qty 1, Price 25, Made In United States, Tariff 25
    Then add Customs Associated Item 26, description random, qty 1, Price 26, Made In United States, Tariff 26
    Then add Customs Associated Item 27, description random, qty 1, Price 27, Made In United States, Tariff 27
    Then add Customs Associated Item 28, description random, qty 1, Price 28, Made In United States, Tariff 28
    Then add Customs Associated Item 29, description random, qty 1, Price 29, Made In United States, Tariff 29
    Then add Customs Associated Item 30, description random, qty 1, Price 30, Made In United States, Tariff 30
    Then add Customs Associated Item 31, description random, qty 1, Price 30, Made In United States, Tariff 31
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click orders toolbar print button
    Then set print modal print-on to Roll - 4" x 6" Shipping Label
    
    Then click print modal print button

   #print_layout_cp72_sdc1200_single_ply
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to international address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFTE |  sdc1200 Right Side 1  | random       | random           | random | random  | random      | Costa Rica | random  | random  |
    Then set order details service to PMEI Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Merchandise
    Then add Customs Associated Item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set Orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

   #print_layout_dpo_cp72_roll_single_ply
    Then add new order
    Then set order details ship-from to default
    Then set Order Details Domestic Ship-To Country to United States
    Then set order details ship-to domestic address to
      | full_name     | company       | street_address      | street_address_2| city | state | zip        | country       | phone  |  email |
      | PSG PFTE | 4⅛ x 6¼ roll | UNIT 8400 BOX 0000  |                  |DPO  | AE    | 09498-9997 | United States | random | random |
    Then set order details weight to 3 lb 2 oz
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Other
    Then add Customs Associated Item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then click orders toolbar print button
    Then set print modal print-on to Roll 418x614
    
    Then click print modal print button

   #print_layout_fsa_cp72_paper_single_ply
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to domestic address to
      | full_name | company | street_address        |street_address_2|  city    | state | zip        | country       | phone  |  email |
      | MM   | 8.5x11  | 118 E Marine Corps Dr |                |Hagatna | GU    | 96910-5126 | United States | random | random |
    Then set order details weight to 1 lb 2 oz
    Then set order details service to MM Package/Flat/Thick Envelope

    Then click Order Details form Customs Form button
    Then set Customs Package Contents to Other
    Then add Customs Associated Item 1, description random, qty 1, Price 25, Made In United States, Tariff 10
    Then set Customs More Info to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set Orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    
    Then click print modal print button

   #print_layout_cp72_single_ply_apo_roll
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
    
    Then click print modal print button

    Then sign out
