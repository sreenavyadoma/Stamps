
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_media @reprint
  Scenario: User Reprints Order - International | CN22

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | Reprint Test | 5.5x8.5 | random           | random           | random | random  | random      | Norway | random  | random  |
    Then on Order Details form, select service FCMI Large Envelope
    Then on Order Details form, set Ounces to 1

    Then click Order Details form Edit Form button
    Then set Customs form Package Contents to Gift
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 30, Made In United States, Tariff 10
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button

    Then In left Filter Panel, select Shipped
    Then in Orders Grid, check saved Order ID
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out

