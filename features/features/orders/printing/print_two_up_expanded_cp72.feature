
@print_two_up_expanded_cp72
Feature: Print 1 Intl CP72 label on 5.5x8.5

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_cp72_5x8_left
  Scenario: Print 1 Intl CP72 label on 5.5x8.5 left

    #print_two_up_expanded_cp72_5x8_left_print1
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI LFR Envelope | 5.5x8.5  | random           | random           | random | random  | random      | Chile | random  | random  |
    Then set order details service to PMI Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

  @print_two_up_expanded_cp72_5x8_right
  Scenario: Print 1 Intl CP72 label on 5.5x8.5 right

   #print_two_up_expanded_cp72_5x8_right_print1
    # 1 CP72 label 5 ½" x 8 ½" right side
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI PFR Envelope |  5.5x8.5 Right Side 1  | random       | random           | random | random  | random      | Argentina | random  | random  |
    Then set order details service to PMEI Padded Flat Rate Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

  @print_two_up_expanded_cp72_left
  Scenario: Print 2 Intl CP72 label left

   #print_two_up_expanded_cp72_paper_left
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to PME FR Envelope, 5.5x8.5, 26930 NE 152nd St., Duvall WA 98019-8316
    Then set order details service to PME Flat Rate Envelope
    Then set order details ounces to 1
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to PME LFR Envelope, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details ounces to 1
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to PME PFR Envelope, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details ounces to 1
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Box | 5.5x8.5  | random           | random           | random | random  | random      | Spain | random  | random  |
    Then set order details service to PMI Large Flat Rate Box
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI Pkg-Flat-Env | 5.5x8.5 | random           | random           | random | random  | random      | Turkey | random  | random  |
    Then set order details service to PMEI Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI FR Envelope | 5.5x8.5 | random           | random           | random | random  | random      | Argentina | random  | random  |
    Then set order details service to PMEI Flat Rate Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then check row 1
    Then check row 2
    Then check row 3
    Then check row 4
    Then check row 5
    Then check row 6
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

  @print_two_up_expanded_cp72_left_print3
  Scenario: Print 3 Intl CP72 label left

   #print_two_up_expanded_cp72_paper_left_print3
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to PME FR Envelope, 5.5x8.5, 26930 NE 152nd St., Duvall WA 98019-8316
    Then set order details service to PME Flat Rate Envelope
    Then set order details ounces to 1
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to PME LFR Envelope, 5.5x8.5, 2105 Kietzke Ln, Reno NV 89502-3602
    Then set order details service to PME Legal Flat Rate Envelope
    Then set order details ounces to 1
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to PME PFR Envelope, 5.5x8.5, 557 County Rd. H, Fredonia WI 53021-9634
    Then set order details service to PME Padded Flat Rate Envelope
    Then set order details ounces to 1
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Box | 5.5x8.5  | random           | random           | random | random  | random      | Spain | random  | random  |
    Then set order details service to PMI Large Flat Rate Box
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI Pkg-Flat-Env | 5.5x8.5 | random           | random           | random | random  | random      | Turkey | random  | random  |
    Then set order details service to PMEI Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMEI FR Envelope | 5.5x8.5 | random           | random           | random | random  | random      | Argentina | random  | random  |
    Then set order details service to PMEI Flat Rate Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then check row 1
    Then check row 2
    Then check row 3
    Then check row 4
    Then check row 5
    Then check row 6
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

    Then sign out


