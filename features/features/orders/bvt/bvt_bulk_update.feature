
Feature: Bulk Update International

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_bulk_update
  Scenario: Bulk Update International

    # Order #1 (Domestic)
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form service to PM Package
    Then set Order Details form Ounces to 1
    Then Pause for 1 second

    # Order #2 (International)
    Then add new order
    Then set Order Details Ship-To International address to
      | full_name     | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country | phone        |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | France  | Random phone | Random email  |
    Then set Order Details form Weight to 2 lb 2 oz
    Then set Order Details form international service to PMEI Package
    Then blur out on Order Details form 2 times

    # Check 1st two orders
    Then check orders grid cached order id
    Then check orders grid cached order id 1
    Then check orders grid cached order id 2
    Then Pause for 1 seconds

    # Updating order details
    Then expect multi order details form is present
    Then blur out on multi order details form
    Then set Multi Order Details Form Ship From to default
    Then set multi order details form domestic service to PM Large Package
    Then set Multi Order Details Form International service to PMI Package
    Then click Multi Order Form Update Order button

    # Uncheck both orders
    Then Pause for 2 seconds
    Then uncheck orders grid cached order id
    Then uncheck orders grid cached order id 1
    Then uncheck orders grid cached order id 2
    Then Pause for 2 seconds

    # verify fields in 1st order
    Then check orders grid cached order id 1
    Then expect Order Details form Ship From is correct
    Then expect Order Details form service is correct
    Then uncheck orders grid cached order id 1

    # verify fields in 2nd order
    Then check orders grid cached order id 2
    Then expect Order Details form Ship From is correct
    Then expect Order Details form international service is correct
    Then uncheck orders grid cached order id 2

    Then Sign out


