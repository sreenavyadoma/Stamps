
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_media @reprint @reprint_media_dev
  Scenario: User Reprints Order - Domestic

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To Country to United States
    Then On Order Details form, set Ship-To to Domestic Address
      | name         | company           | street_address  |street_address_2|  city        | state| zip   | country       | phone  |  email |
      | Reprint Test | 4.125 x 6.25 roll | 604 Arizona Ave |                | Santa Monica | CA   | 90401 | United States | 8885551212 | test@stamps.com |
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Ounces to 1

    Then Pause for 2 seconds
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Roll - 4 ⅛" x 6 ¼" Shipping Label"
    Then In Print modal, click Print button

    Then In left filter panel, select Shipped
    Then In Orders Grid, check saved Order ID
    Then In Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out

