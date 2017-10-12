
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
    Then check orders grid cached order id
    Then in Print modal, Open Reprint Modal
    Then Label Unavailable:  Expect Visible
    Then Pause for 5 seconds

    Then Sign out


  @reprint_media_close
  Scenario: User Reprints Order - Closes Reprint Modal before reprint

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form service to PM Package
    Then set Order Details form Pounds to 1

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Print modal Printer to "factory"
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid cached order id
    Then in Print modal, Open Reprint Modal
    Then Close Reprint Modal
    Then Sign out


  @reprint_media1
  Scenario: User Reprints Order - Domestic

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To Domestic address to
      | full_name         | company           | street_address  |street_address_2|  city        | state| zip   | country       | phone  |  email |
      | Reprint Test | 4.125 x 6.25 roll | 604 Arizona Ave |                | Santa Monica | CA   | 90401 | United States | 8885551212 | test@stamps.com |
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Roll 418x614"
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid cached order id
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out


  @reprint_media2
  Scenario: User Reprints Order - APO | CP72

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To Domestic address to
      | full_name   | company      | street_address    |street_address_2| city | state | zip    | country       | phone  |  email |
      | Reprint Test | 4x6 roll | PSC 3 BOX 4120  |                | APO  | AE     |  09021  | United States | 8885551212 | test@stamps.com |
    Then set Order Details form Weight to 2 lb 1 oz
    Then set Order Details form service to PSG Package
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Roll - 4" x 6" Shipping Label"
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid cached order id
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out


  @reprint_media3
  Scenario: User Reprints Order - International | CN22

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | Reprint Test | 5.5x8.5 | random           | random           | random | random  | random      | Norway | random  | random  |
    Then set Order Details form service to FCMI Large Envelope
    Then set Order Details form Ounces to 1

    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Gift
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then set Print modal Printer to "factory"
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid cached order id
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out


  @reprint_media4
  Scenario: User Reprints Order - International | CP72

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | Reprint Test | SDC-1200 | random           | random           | random | random  | random      | New Zealand | random  | random  |
    Then set Order Details form service to PMI Large Flat Rate Box
    Then set Order Details form Ounces to 1

    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then set Print modal Printer to "factory"
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid cached order id
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out


  @reprint_media5
  Scenario: User Reprints Order - US Territory | CP72

    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To Domestic address to
      | full_name         | company            | street_address | street_address_2| city | state | zip        | country       | phone  |  email |
      | Reprint Test | 8.5x11 Plain Paper | PO Box 10281   |                 | Palau| PW    | 96940-0881 | United States | 8885551212 | test@stamps.com |
    Then set Order Details form Weight to 2 lb 1 oz
    Then set Order Details form service to MM Package
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then click print modal print button

    Then select Filter Panel tab Shipped
    Then check orders grid cached order id
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out

