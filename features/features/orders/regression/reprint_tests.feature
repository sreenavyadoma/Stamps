
@reprint_tests
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_change_status
  Scenario: Allow User to Manually Change Order Status - User Reprints Order
    Then select Filter Panel tab Shipped
    Then select Filter Panel tab Awaiting Shipment

    Then add new order

    Then select Grid Toolbar Move menu item Move to Shipped
    Then select Filter Panel tab Shipped
    Then In left Filter Panel, expect order moved to Shipped

    Then select Filter Panel tab Shipped
    Then check orders grid order id cached
    Then in Print modal, Open Reprint Modal
    Then Label Unavailable:  Expect Visible
    Then pause for 5 seconds

    Then sign out


  @reprint_media_close
  Scenario: User Reprints Order - Closes Reprint Modal before reprint

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details service to PM Package
    Then set order details pounds to 1

    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid order id cached
    Then in Print modal, Open Reprint Modal
    Then Close Reprint Modal
    Then sign out


  @reprint_media1
  Scenario: User Reprints Order - Domestic

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details domestic ship-to country to United States
    Then set order details ship-to domestic address to
      | full_name         | company           | street_address  |street_address2|  city        | state| zip   | country       | phone  |  email |
      | Reprint Test | 4.125 x 6.25 roll | 604 Arizona Ave |                | Santa Monica | CA   | 90401 | United States | 8885551212 | test@stamps.com |
    Then set order details service to PM Package
    Then set order details ounces to 1

    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Roll 418x614
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid order id cached
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then sign out


  @reprint_media2
  Scenario: User Reprints Order - APO | CP72

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details domestic ship-to country to United States
    Then set order details ship-to domestic address to
      | full_name   | company      | street_address    |street_address2| city | state | zip    | country       | phone  |  email |
      | Reprint Test | 4x6 roll | PSC 3 BOX 4120  |                | APO  | AE     |  09021  | United States | 8885551212 | test@stamps.com |
    Then set order details weight to 2 lb 1 oz
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Roll - 4" x 6" Shipping Label
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid order id cached
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then sign out


  @reprint_media3
  Scenario: User Reprints Order - International | CN22

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country    | phone   |  email  |
      | Reprint Test | 5.5x8.5 | random           | random           | random | random  | random      | Norway | random  | random  |
    Then set order details service to FCMI Large Envelope/Flat
    Then set order details ounces to 1

    Then click order details form customs form button
    Then set customs package contents to Gift
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid order id cached
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then sign out


  @reprint_media4
  Scenario: User Reprints Order - International | CP72

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to international address to
      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country    | phone   |  email  |
      | Reprint Test | SDC-1200 | random           | random           | random | random  | random      | New Zealand | random  | random  |
    Then set order details service to PMI Large Flat Rate Box
    Then set order details ounces to 1

    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then set orders print modal printer
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid order id cached
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then sign out


  @reprint_media5
  Scenario: User Reprints Order - US Territory | CP72

    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details domestic ship-to country to United States
    Then set order details ship-to domestic address to
      | full_name         | company            | street_address | street_address2| city | state | zip        | country       | phone  |  email |
      | Reprint Test | 8.5x11 Plain Paper | PO Box 10281   |                 | Palau| PW    | 96940-0881 | United States | 8885551212 | test@stamps.com |
    Then set order details weight to 2 lb 1 oz
    Then set order details service to MM Package/Flat/Thick Envelope
    Then click order details form customs form button
    Then set customs package contents to Merchandise
    Then add customs associated item 1, description random, qty 1, Price 30, Made In United States, Tariff 10
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form

    Then pause for 2 seconds
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then set orders print modal printer
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid order id cached
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then sign out

