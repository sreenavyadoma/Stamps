
Feature: Bulk Update International

  Background:
    Given a valid user is signed in to Web Apps

  @bulk_update_int
  Scenario: Bulk Update International

    #Adding 1st order
    Then add new order
    Then set Multi Order Details Form Ship From to default
    Then set Order Details Ship-To International address to
      | full_name          | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country | phone         |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | India  | Random phone  | Random email  |
    Then set Order Details form Weight to 2 lb 2 oz
    Then set Order Details form service to PMEI Package
    Then on Order Details form, blur out 2 times
    Then Pause for 1 seconds
    Then on Order Details form, blur out 2 times

    #Adding 2nd order
    Then add new order
    Then set Multi Order Details Form Ship From to default
    Then set Order Details Ship-To International address to
      | full_name          | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country | phone         |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | France  | Random phone  | Random email  |
    Then set Order Details form Weight to 2 lb 2 oz
    Then set Order Details form service to PMEI Package
#    Then on Order Details form, blur out 2 times
#    Then Pause for 1 seconds
#    Then on Order Details form, blur out 2 times

    #Check 1st two orders
#    Then Pause for 4 seconds
#    Then uncheck Orders Grid row 1
#    Then uncheck Orders Grid row 2
#    Then Refresh the browser
    Then check Orders Grid row 1
    Then check Orders Grid row 2

    #Updating order details
    Then set Multi Order Details Form Ship From to Bulk Update Order 1
      #Then set Multi Order Details form Pounds to 3
    Then set Multi Order Details Form International service to PMI Package
    #Then expect Multi Order Details Form International service is PMI Package

    Then click Multi Order Form Update Orders button
    Then Pause for 3 seconds
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    Then click Multi Order Form Update Orders button
    Then Pause for 3 seconds
    #Then Refresh the browser

    #verify fields in 1st order
    Then check Orders Grid row 1
    Then expect Order Details form Ship From is Bulk Update Order 1
      #Then expect Order Details form Pound is 3
    Then expect Order Details form International service is PMI Package
    Then uncheck Orders Grid row 1

    #verify fields in 2nd order
    Then check Orders Grid row 2
    Then expect Order Details form Ship From is Bulk Update Order 1
      #Then expect Order Details form Pound is 3
    Then expect Order Details form International service is PMI Package

    Then Sign out