# encoding: utf-8
@print_labels_5x8
Feature: I want is able to print to 5.5 x 8.5 labels (single or multi) B-01667

  Background:
  Given a valid user is signed in to Web Apps

  Scenario: Print - Shipping Label: 5 ½" x 8 ½"
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    #Then View Print On option Shipping Label 5.5 x 8.5 tooltip
    #Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Use these letter-sized label sheets with two 5 ½” x 8 ½” labels per sheet to print postage, addresses, and tracking barcode."
   # Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Can be used to ship Large Envelopes, Packages, USPS Flat Rate Envelopes or Boxes, or USPS Regional Rate Boxes to any U.S. destination."
    #Then Expect Shipping Label 5.5 x 8.5 tool-tip to contain "Avery 5126, 8126, 5526, 5783, 15516, 18126, 85783"
    Then click print modal print button
    Then sign out

  Scenario: Print - Shipping Label: 8 ½" x 11" Paper
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then click print modal print button

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click orders toolbar print button
    Then set print modal print-on to Roll 418x614
    Then click print modal print button

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click orders toolbar print button
    Then set print modal print-on to Roll - 4" x 6" Shipping Label
    Then click print modal print button


    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then click print modal print button

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then click print modal print button
    Then sign out

  Scenario: Print - Shipping Label: Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then click print modal print button
    Then sign out

  Scenario: Print - Shipping Label: 5 ½" x 8 ½"
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then click print modal print button
    Then sign out

  Scenario: Print - Roll - 4" x 6" Shipping Label
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click orders toolbar print button
    Then set print modal print-on to Roll - 4" x 6" Shipping Label
    Then click print modal print button
    Then sign out

  Scenario: Print - Roll 418x614
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click orders toolbar print button
    Then set print modal print-on to Roll 418x614
    Then click print modal print button
    Then sign out

  Scenario: Multi Order Printing - Shipping Label: 5 ½" x 8 ½"
    #Create order 1
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then check row 1

    #Create order 2
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then check row 1

    #Create order 3
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details ounces to 2
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then check row 1

    Then check row 1
    Then check row 2
    Then check row 3

    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then click print modal print button Sample
    Then Expect system will only print first order
    Then sign out

  Scenario:  User prints postage for CN22 Shipping Label 5.5 x 8.5
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to domestic address to
      | full_name            | company                 | street_address      | street_address2 |  city          | state | zip        | country       | phone  |  email |
      | Jessie Joe      | The CN 22 House         | PSC 819 BOX 1       |                  | FPO           | AE    | 09645-0001 | United States |        |        |
    Then set order details service to PM Package
    Then set order details ounces to 5
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 20, Made In United States, Tariff 10
    Then close customs information form
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then click print modal print button
    Then sign out

  Scenario:  User prints postage for CP72 Shipping Label 5.5 x 8.5
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to domestic address to
      | full_name            | company                 | street_address      | street_address2| city          | state | zip        | country       | phone  |  email |
      | Tammmy Moo      | The CP72 House          | Unit 15324          |                 | APO           | AP    | 96205-5324 | United States |        |        |
    Then set order details service to PM Package
    Then set order details pounds to 3
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click order details form customs form button
    Then add customs associated item 1, description random, qty 1, Price 20, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then click print modal print button
    Then sign out
