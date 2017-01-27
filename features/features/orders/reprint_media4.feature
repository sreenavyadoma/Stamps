
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_media @reprint
  Scenario: User Reprints Order - International | CP72

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country    | phone   |  email  |
      | Reprint Test | SDC-1200 | random           | random           | random | random  | random      | New Zealand | random  | random  |
    Then On Order Details form, select service PMI Large Flat Rate Box
    Then On Order Details form, set Ounces to 1

    Then On Order Details form, click Edit Form button
    Then On Customs form, set Package Contents to Merchandise
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 30, Origin United States, Tariff 10
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button

    Then Pause for 2 seconds
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾""
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button

    Then In left filter panel, select Shipped
    Then In Orders Grid, check saved Order ID
    Then In Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out

