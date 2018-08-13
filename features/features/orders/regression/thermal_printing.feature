
Feature: Thermal Printer

  Background:
    Given a valid user is signed in to Web Apps

  @print_on_thermal
  Scenario:  As a batch shipper, I want is able to change my print media
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address in zone 8
    Then set order details pounds to 1
    Then set order details ounces to 1
    Then set order details service to PM Package
    Then set order details width to 1
    Then set order details height to 1
    Then set order details length to 1
    Then click orders toolbar print button
    Then set print modal print-on to Roll - 4 x 6
    Then click print modal print button
    Then sign out

