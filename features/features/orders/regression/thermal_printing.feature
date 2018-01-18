
Feature: Thermal Printer

  Background:
    Given a valid user is signed in to Web Apps

  @print_on_thermal
  Scenario:  As a batch shipper, I want is able to change my print media
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 5 and 8
    Then set Order Details Pounds to 1
    Then set Order Details Ounces to 1
    Then set Order Details service to PM Package
    Then set Order Details Width to 1
    Then set Order Details Height to 1
    Then set Order Details Length to 1
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Roll - 4 x 6
    Then click print modal print button
    Then Sign out

