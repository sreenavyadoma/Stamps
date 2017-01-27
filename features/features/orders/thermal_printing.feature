
Feature: Thermal Printer

  Background:
    Given a valid user is signed in to Web Apps

  @print_on_thermal
  Scenario:  As a batch shipper, I want is able to change my print media
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 5 through 8
    Then On Order Details form, set Pounds to 1
    Then On Order Details form, set Ounces to 1
    Then On Order Details form, select service PM Package
    Then On Order Details form, set Width to 1
    Then On Order Details form, set Height to 1
    Then On Order Details form, set Length to 1
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Roll - 4" x 6" Shipping Label"
    Then In Print modal, click Print button
    Then Sign out

