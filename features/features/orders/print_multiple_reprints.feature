Feature: Multiple Reprints

  Background:
    Given a valid user is signed in to Web Apps

  @print_multiple_reprints
  Scenario: Multiple reprints in 24 hour period

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then on Order Details form, select service MM Package
    Then on Order Details form, set Ounces to 1
    Then in Orders Toolbar, click Print button
    Then in Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button
    Then In left Filter Panel, select Shipped
    Then In Orders Grid, check saved Order ID
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint
    Then In left Filter Panel, select Shipped
    Then In Orders Grid, check saved Order ID
    Then in Print modal, Open Reprint Modal
    Then ReIn Print modal, Reprint

    Then Sign out