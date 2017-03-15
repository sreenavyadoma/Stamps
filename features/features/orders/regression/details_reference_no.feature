
Feature:  Order Details Form - Reference # Field
  Add Reference # Field and Print Reference # Checkbox

  Background:
    Given a valid user is signed in to Web Apps

  @details_reference_no
  Scenario: Reference Number
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Large Envelope
    Then set Order Details form Ounces to 2

    Then set Order Details form Reference Number to random
    Then expect Order Details form Reference Number is correct

    Then set Order Details form Reference Number to Rob
    Then expect Order Details form Reference Number is Rob

    Then in Orders Toolbar, click Print button
    Then in Print modal, uncheck Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then set Print modal Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then set Print modal Printer to "factory"
    Then in Print modal, click Print button
    Then Sign out

