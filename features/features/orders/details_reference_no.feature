
Feature:  Order Details Form - Reference # Field
  Add Reference # Field and Print Reference # Checkbox

  Background:
    Given a valid user is signed in to Web Apps

  @details_reference_no
  Scenario: Reference Number
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, set Ounces to 2

    Then on Order Details form, set Reference Number to random
    Then on Order Details form, expect Reference Number is random

    Then on Order Details form, set Reference Number to Rob
    Then on Order Details form, expect Reference Number is Rob

    Then in Orders Toolbar, click Print button
    Then in Print modal, uncheck Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then in Print modal, check Print Reference # on Shipping Label
    Then in Print modal, set Print-On to "Shipping Label - 8 ½" x 11" Paper"
    Then in Print modal, set Printer to "factory"
    Then in Print modal, click Print button
    Then Sign out

