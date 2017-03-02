
Feature: Thermal Printer

  Background:
    Given a valid user is signed in to Web Apps

  @print_on_thermal
  Scenario:  As a batch shipper, I want is able to change my print media
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to address in Zone 5 through 8
    Then set Order Details form Pounds to 1
    Then set Order Details form Ounces to 1
    Then on Order Details form, select service PM Package
    Then set Order Details form Width to 1
    Then set Order Details form Height to 1
    Then set Order Details form Length to 1
    Then in Orders Toolbar, click Print button
    Then set Print modal Print-On to "Roll - 4" x 6" Shipping Label"
    Then in Print modal, click Print button
    Then Sign out

