
Feature:  Order Details Form - Reference # Field
  Add Reference # Field and Print Reference # Checkbox

  Background:
    Given A user is signed in to Orders

  @details_reference_no
  Scenario: Reference Number
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PM Large Envelope
    Then On Order Details form, set Ounces to 2

    Then On Order Details form, set Reference Number to random
    Then On Order Details form, expect Reference Number is random

    Then On Order Details form, set Reference Number to Rob
    Then On Order Details form, expect Reference Number is Rob

    Then In Orders Toolbar, click Print button
    Then In Print modal, uncheck Print Reference # on Shipping Label
    Then In Print modal, check Print Reference # on Shipping Label
    Then In Print modal, check Print Reference # on Shipping Label
    Then In Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then In Print modal, set Printer to "factory"
    Then In Print modal, click Print button
    Then Sign out

