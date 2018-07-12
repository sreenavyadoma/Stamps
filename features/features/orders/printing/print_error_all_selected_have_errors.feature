
Feature:  Prompt User to Remove Orders in Error from Print Group

  Background:
    Given a valid user is signed in to Web Apps

  @printing_error
  Scenario:  Printing
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then check row 1
    Then Print Order expecting error A service must be selected before printing.

    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then check row 1
    Then check row 2
    Then Print Order expecting error All selected orders have errors and cannot be printed.

    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then add new order
    #Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details pounds to 1
    Then set order details ounces to 1
    Then set order details service to PM Regional Rate Box A
    Then check row 1
    Then check row 2
    Then Print expecting 1 of 2 selected orders have errors and cannot be printed. To print the remaining orders, click Continue.
    Then sign out
