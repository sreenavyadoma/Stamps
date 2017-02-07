
Feature: Print Multiple Orders

  Background:
    Given a valid user is signed in to Web Apps

  @print_multiple_orders
  Scenario:  Print
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Ounces to 1

    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, set Ounces to 1

    Then in Orders Grid, check row 1
    Then in Orders Grid, check row 2

    Then in Print modal, click Print button
    Then Sign out
