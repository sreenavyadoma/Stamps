
Feature: Print Multiple Orders

  Background:
    Given a valid user is signed in to Web Apps

  @print_multiple_orders
  Scenario:  Print
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, set Ounces to 1

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, set Ounces to 1

    Then In Orders Grid, check row 1
    Then In Orders Grid, check row 2

    Then In Print modal, click Print button
    Then Sign out
