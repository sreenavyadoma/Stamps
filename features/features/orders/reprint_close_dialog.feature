
Feature: As a batch shipper, I want is able to Reprint for Orders in "Shipped" View [B-01639]

  Background:
    Given a valid user is signed in to Web Apps

  @reprint_media_close @reprint
  Scenario: User Reprints Order - Closes Reprint Modal before reprint

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Pounds to 1

    Then Pause for 2 seconds
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button

    Then In left filter panel, select Shipped
    Then In Orders Grid, check saved Order ID
    Then In Print modal, Open Reprint Modal
    Then Close Reprint Modal
    Then Sign out

