
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_media @reprint @reprint_media_dev
  Scenario: User Reprints Order - Domestic

    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To Country to United States
    Then set Order Details form Ship-To to Domestic Address
      | name         | company           | street_address  |street_address_2|  city        | state| zip   | country       | phone  |  email |
      | Reprint Test | 4.125 x 6.25 roll | 604 Arizona Ave |                | Santa Monica | CA   | 90401 | United States | 8885551212 | test@stamps.com |
    Then on Order Details form, select service PM Package
    Then set Order Details form Ounces to 1

    Then Pause for 2 seconds
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then in Print modal, click Print button

    Then In left Filter Panel, select Shipped
    Then in Orders Grid, check saved Order ID
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out

