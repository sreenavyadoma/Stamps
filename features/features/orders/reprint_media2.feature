
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_media @reprint
  Scenario: User Reprints Order - APO | CP72

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To Country to United States
    Then on Order Details form, set Ship-To to Domestic Address
      | name   | company      | street_address    |street_address_2| city | state | zip    | country       | phone  |  email |
      | Reprint Test | 4x6 roll | PSC 3 BOX 4120  |                | APO  | AE     |  09021  | United States | 8885551212 | test@stamps.com |
    Then on Order Details form, set Weight to 2 lb 1 oz
    Then on Order Details form, select service PSG Package
    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Merchandise
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In is United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Roll - 4" x 6" Shipping Label"
    Then in Print modal, click Print button

    Then In left Filter Panel, select Shipped
    Then in Orders Grid, check saved Order ID
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out

