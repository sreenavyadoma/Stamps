
@print_two_up_expanded_cn22
Feature: Print 2 Intl CN22 labels on 5.5x8.5

  Background:
    Given a valid user is signed in to Web Apps

  @print_two_up_expanded_cn22_5x8_right_print2
  Scenario: Print 2 Intl CN22 labels on 5.5x8.5

   #print_two_up_expanded_cn22_5x8_right_print2
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Lg Env-Flat | 5.5x8.5 Right Side 2 | random           | random           | random | random  | random      | Croatia | random  | random  |
    Then set order details service to FCMI Large Envelope/Flat
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Pkg-Thick Env | 5.5x8.5 Right Side 1 | random           | random           | random | random  | random      | India | random  | random  |
    Then set order details service to FCMI Package/Thick Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then check row 1
    Then check row 2
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

  @print_two_up_expanded_cn22_5x8_cp72_right_print2
  Scenario: Print 2 Intl CN22 labels on 5.5x8.5 right

  #print_two_up_expanded_cn22_cp72_5x8_right_print2
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1         | street_address2 | city   | province | postal_code  | country| phone   |  email  |
      | PMEI MFR Box | SDC-1200  | 234 Laurier Avenue West  | random     | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then set order details weight to 1 lb 1 oz
    Then set order details service to FCMI Large Envelope/Flat
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country    | phone   |  email  |
      | FCMI Letter | SDC-1200  | random           | random           | random | random  | random      | Costa Rica | random  | random  |
    Then set order details service to PMI Flat Rate Envelope
    Then set order details weight to 1 lb 1 oz
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then check row 2

    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

  @print_two_up_expanded_cn22_left_print2
  Scenario: Print 2 Intl CN22 labels Left

   #print_two_up_expanded_cn22_paper_left
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to domestic address to
      | full_name        | company             | street_address  | street_address2| city | state | zip        | country       | phone  |  email |
      | PM RR Box B | Domestic FPO 8.5x11 | PSC 473 BOX 12  |                 | FPO  | AP    | 96349-0001 | United States | random | random |

    Then set order details service to PM Regional Rate Box B
    Then set order details weight to 2 lb 1 oz
    Then on order details form, add item 1, qty 1, id random, description random
    Then on order details form, add item 2, qty 2, id random, description random
    Then on order details form, add item 3, qty 3, id random, description random

    Then on Order Details form, Delete Item 1
    Then on Order Details form, Delete Item 2

    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

  @print_two_up_expanded_cn22_right_print2
  Scenario: Print 2 Intl CN22 labels right

   #print_two_up_expanded_cn22_paper_right
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI PFR Envelope | 8.5x11 Right Side 2 | random           | random           | random | random  | random      | Australia | random  | random  |
    Then set order details service to PMI Padded Flat Rate Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI LFR Envelope | 8.5x11 Right Side 1 | random           | random           | random | random  | random      | Japan | random  | random  |
    Then set order details service to PMI Legal Flat Rate Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then check row 1
    Then check row 2
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then select Print modal right-side label
    Then expect Print modal right-side label is selected
    Then click print modal print button

  @print_two_up_expanded_cn22_sdc1200_left_print2
  Scenario: Print 2 Intl CN22 labels on sdc 1200 left

   #print_two_up_expanded_cn22_sdc1200_left
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
      | PMI Pkg-Flat-Env | SDC-1200  | random           | random           | random | random  | random      | Australia | random  | random  |
    Then set order details service to PMI Flat Rate Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1         | street_address2 | city   | province | postal_code  | country| phone   |  email  |
      | PMI FR Envelope | SDC-1200  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    Then set order details service to PMI Flat Rate Envelope
    Then set order details ounces to 1
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then check row 1
    Then check row 2
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then select Print modal left-side label
    Then expect Print modal left-side label is selected
    Then click print modal print button

    Then sign out
