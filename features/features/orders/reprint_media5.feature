
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_media @reprint
  Scenario: User Reprints Order - US Territory | CP72

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to Domestic Address
      | name         | company            | street_address | street_address_2| city | state | zip        | country       | phone  |  email |
      | Reprint Test | 8.5x11 Plain Paper | PO Box 10281   |                 | Palau| PW    | 96940-0881 | United States | 8885551212 | test@stamps.com |
    Then set Order Details form Weight to 2 lb 1 oz
    Then on Order Details form, select service MM Package
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then click Customs form Close button

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then in Print modal, click Print button

    Then In left Filter Panel, select Shipped
    Then in Orders Grid, check saved Order ID
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out

