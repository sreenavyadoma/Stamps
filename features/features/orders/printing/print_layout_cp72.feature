Feature: Print 1 Intl CP72 label

  Background:
    Given a valid user is signed in to Web Apps

  @print_layout_cp72
  Scenario: Print 1 Intl CP72 label

    #print_layout_cp72_4x6roll
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 4x6 Roll  | random           | random           | random | random  | random      | France | random  | random  |
    Then set Order Details form service to PMI Package
    Then set Order Details form Ounces to 1
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Roll - 4" x 6" Shipping Label"
    Then click print modal print button Sample
    Then click print modal print button

    #print_layout_cp72_5x8_left
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 5.5x8.5  | random           | random           | random | random  | random      | Chile | random  | random  |
    Then set Order Details form service to PMI Package
    Then set Order Details form Ounces to 1

    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then set Customs form ITN Number to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Print modal Printer to "factory"
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

   #print_layout_cp72_5x8_right
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name              | company   | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFR Envelope |  5.5x8.5 Right Side 1  | random       | random           | random | random  | random      | Argentina | random  | random  |
    Then set Order Details form service to PMEI Padded Flat Rate Envelope
    Then set Order Details form Ounces to 1
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

    #print_layout_cp72_5x8_single_ply
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFRB |  5.5x8.5 Left Side | random       | random           | random | random  | random      | Australia | random  | random  |
    Then set Order Details form service to PMI Large Flat Rate Box
    Then set Order Details form Ounces to 1
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Gift
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Print modal Printer to "factory"
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

   #print_layout_cp72_paper_continuation
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFTE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
    Then set Order Details form service to PMI Flat Rate Envelope
    Then set Order Details form Weight to 1 lb 14 oz
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 2, Description random, Qty 1, Price 1, Made In United States, Tariff 2
    Then add Customs form Associated Item 3, Description random, Qty 1, Price 1, Made In United States, Tariff 3
    Then add Customs form Associated Item 4, Description random, Qty 1, Price 1, Made In United States, Tariff 4
    Then add Customs form Associated Item 5, Description random, Qty 1, Price 1, Made In United States, Tariff 5
    Then add Customs form Associated Item 6, Description random, Qty 1, Price 1, Made In United States, Tariff 6
    Then add Customs form Associated Item 7, Description random, Qty 1, Price 1, Made In United States, Tariff 7
    Then add Customs form Associated Item 8, Description random, Qty 1, Price 1, Made In United States, Tariff 8
    Then add Customs form Associated Item 9, Description random, Qty 1, Price 1, Made In United States, Tariff 9
    Then add Customs form Associated Item 10, Description random, Qty 1, Price 1, Made In United States, Tariff 10
    Then add Customs form Associated Item 11, Description random, Qty 1, Price 1, Made In United States, Tariff 11
    Then add Customs form Associated Item 12, Description random, Qty 1, Price 1, Made In United States, Tariff 12
    Then add Customs form Associated Item 13, Description random, Qty 1, Price 1, Made In United States, Tariff 13
    Then add Customs form Associated Item 14, Description random, Qty 1, Price 1, Made In United States, Tariff 14
    Then add Customs form Associated Item 15, Description random, Qty 1, Price 1, Made In United States, Tariff 15
    Then add Customs form Associated Item 16, Description random, Qty 1, Price 1, Made In United States, Tariff 16
    Then add Customs form Associated Item 17, Description random, Qty 1, Price 1, Made In United States, Tariff 17
    Then add Customs form Associated Item 18, Description random, Qty 1, Price 1, Made In United States, Tariff 18
    Then add Customs form Associated Item 19, Description random, Qty 1, Price 1, Made In United States, Tariff 19
    Then add Customs form Associated Item 20, Description random, Qty 1, Price 1, Made In United States, Tariff 20
    Then add Customs form Associated Item 21, Description random, Qty 1, Price 1, Made In United States, Tariff 21
    Then add Customs form Associated Item 22, Description random, Qty 1, Price 1, Made In United States, Tariff 22
    Then add Customs form Associated Item 23, Description random, Qty 1, Price 1, Made In United States, Tariff 23
    Then add Customs form Associated Item 24, Description random, Qty 1, Price 1, Made In United States, Tariff 24
    Then add Customs form Associated Item 25, Description random, Qty 1, Price 1, Made In United States, Tariff 25
    Then add Customs form Associated Item 26, Description random, Qty 1, Price 1, Made In United States, Tariff 26
    Then add Customs form Associated Item 27, Description random, Qty 1, Price 1, Made In United States, Tariff 27
    Then add Customs form Associated Item 28, Description random, Qty 1, Price 1, Made In United States, Tariff 28
    Then add Customs form Associated Item 29, Description random, Qty 1, Price 1, Made In United States, Tariff 29
    Then add Customs form Associated Item 30, Description random, Qty 1, Price 1, Made In United States, Tariff 30
    Then Pause for 2 seconds
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then Pause for 2 seconds
    Then close Customs Information form
    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button Sample
    Then click print modal print button

   #print_layout_cp72_paper_single_ply
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFRE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
    Then set Order Details form service to PMI Package
    Then set Order Details form Ounces to 1
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Document
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button Sample
    Then click print modal print button

   #print_layout_cp72_roll_continuation
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name     | company   | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | PMI LFRB |  4x6 Roll | random           | random           | random | random  | random      | Italy   | random  | random  |
    Then set Order Details form service to PMI Large Flat Rate Box
    Then set Order Details form Weight to 2 lb 0 oz
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 1
    Then add Customs form Associated Item 2, Description random, Qty 1, Price 2, Made In United States, Tariff 2
    Then add Customs form Associated Item 3, Description random, Qty 1, Price 3, Made In United States, Tariff 3
    Then add Customs form Associated Item 4, Description random, Qty 1, Price 4, Made In United States, Tariff 4
    Then add Customs form Associated Item 5, Description random, Qty 1, Price 5, Made In United States, Tariff 5
    Then add Customs form Associated Item 6, Description random, Qty 1, Price 6, Made In United States, Tariff 6
    Then add Customs form Associated Item 7, Description random, Qty 1, Price 7, Made In United States, Tariff 7
    Then add Customs form Associated Item 8, Description random, Qty 1, Price 8, Made In United States, Tariff 8
    Then add Customs form Associated Item 9, Description random, Qty 1, Price 9, Made In United States, Tariff 9
    Then add Customs form Associated Item 10, Description random, Qty 1, Price 10, Made In United States, Tariff 10
    Then add Customs form Associated Item 11, Description random, Qty 1, Price 11, Made In United States, Tariff 11
    Then add Customs form Associated Item 12, Description random, Qty 1, Price 12, Made In United States, Tariff 12
    Then add Customs form Associated Item 13, Description random, Qty 1, Price 13, Made In United States, Tariff 13
    Then add Customs form Associated Item 14, Description random, Qty 1, Price 14, Made In United States, Tariff 14
    Then add Customs form Associated Item 15, Description random, Qty 1, Price 15, Made In United States, Tariff 15
    Then add Customs form Associated Item 16, Description random, Qty 1, Price 16, Made In United States, Tariff 16
    Then add Customs form Associated Item 17, Description random, Qty 1, Price 17, Made In United States, Tariff 17
    Then add Customs form Associated Item 18, Description random, Qty 1, Price 18, Made In United States, Tariff 18
    Then add Customs form Associated Item 19, Description random, Qty 1, Price 19, Made In United States, Tariff 19
    Then add Customs form Associated Item 20, Description random, Qty 1, Price 20, Made In United States, Tariff 20
    Then add Customs form Associated Item 21, Description random, Qty 1, Price 21, Made In United States, Tariff 21
    Then add Customs form Associated Item 22, Description random, Qty 1, Price 22, Made In United States, Tariff 22
    Then add Customs form Associated Item 23, Description random, Qty 1, Price 23, Made In United States, Tariff 23
    Then add Customs form Associated Item 24, Description random, Qty 1, Price 24, Made In United States, Tariff 24
    Then add Customs form Associated Item 25, Description random, Qty 1, Price 25, Made In United States, Tariff 25
    Then add Customs form Associated Item 26, Description random, Qty 1, Price 26, Made In United States, Tariff 26
    Then add Customs form Associated Item 27, Description random, Qty 1, Price 27, Made In United States, Tariff 27
    Then add Customs form Associated Item 28, Description random, Qty 1, Price 28, Made In United States, Tariff 28
    Then add Customs form Associated Item 29, Description random, Qty 1, Price 29, Made In United States, Tariff 29
    Then add Customs form Associated Item 30, Description random, Qty 1, Price 30, Made In United States, Tariff 30
    Then add Customs form Associated Item 31, Description random, Qty 1, Price 30, Made In United States, Tariff 31
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Roll - 4" x 6" Shipping Label"
    Then click print modal print button Sample
    Then click print modal print button

   #print_layout_cp72_sdc1200_single_ply
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFTE |  sdc1200 Right Side 1  | random       | random           | random | random  | random      | Costa Rica | random  | random  |
    Then set Order Details form service to PMEI Package
    Then set Order Details form Ounces to 1
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then set Print modal Printer to "factory"
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

   #print_layout_dpo_cp72_roll_single_ply
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To Domestic address to
      | full_name     | company       | street_address      | street_address_2| city | state | zip        | country       | phone  |  email |
      | PSG PFTE | 4⅛ x 6¼ roll | UNIT 8400 BOX 0000  |                  |DPO  | AE    | 09498-9997 | United States | random | random |
    Then set Order Details form Weight to 3 lb 2 oz
    Then set Order Details form service to PSG Package
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Other
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then click print modal print button Sample
    Then click print modal print button

   #print_layout_fsa_cp72_paper_single_ply
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Domestic address to
      | full_name | company | street_address        |street_address_2|  city    | state | zip        | country       | phone  |  email |
      | MM   | 8.5x11  | 118 E Marine Corps Dr |                |Hagatna | GU    | 96910-5126 | United States | random | random |
    Then set Order Details form Weight to 1 lb 2 oz
    Then set Order Details form service to MM Package

    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Other
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 25, Made In United States, Tariff 10
    Then set Customs form More Info to random
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button Sample
    Then click print modal print button

   #print_layout_cp72_single_ply_apo_roll
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Domestic address to
      | full_name   | company      | street_address    |street_address_2|  city | state | zip    | country       | phone  |  email |
      | PSG LP | 4x6 roll | PSC 3 BOX 4120  |                      |APO  | AE     |  09021  | United States | random | random |
    Then set Order Details form Weight to 2 lb 1 oz
    Then set Order Details form service to PSG Package
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Roll - 4" x 6" Shipping Label"
    Then click print modal print button Sample
    Then click print modal print button

    Then Sign out
