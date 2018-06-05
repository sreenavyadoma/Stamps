@mobile_orders_smoke_test
@bvt_all_tests
Feature:  BVT tests for Orders

  Background:
    Given a valid user is signed in to Web Apps

  @bvt_bulk_update
  Scenario: BVT Bulk Update International

  # Order #1 (Domestic)
    Then in Orders Grid, Sort Order Date in Descending Order
    Then add order 1
    Then set order details ship-from to default
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Package
    Then set order details ounces to 1
    Then pause for 1 second

  # Order #2 (International)
    Then add order 2
    Then set order details ship-to international address to
      | full_name     | company       | street_address_1 | street_address_2 | city          | province      | postal_code   | country | phone        |  email        |
      | Random string | Random string | Random string    | Random string    | Random string | Random string | Random string | France  | Random phone | Random email  |
    Then set order details weight to 0 lb 1 oz
    Then set order details international service to PMEI Package/Flat/Thick Envelope
    Then blur out on order details form

  # Check 1st two orders
    Then pause for 1 second
    Then check order 1
    Then pause for 1 second
    Then check order 2
    Then pause for 1 seconds

  # Updating order details
    Then expect Bulk Update is present
    Then blur out on multi order details form
    Then set Bulk Update Ship From to default
    Then set Bulk Update domestic service to PM Large Package
    Then set Bulk Update International service to PMI Package/Flat/Thick Envelope
    Then click Bulk Update Update Order button

  # Uncheck both orders
    Then pause for 1 second
    Then uncheck order 1
    Then pause for 1 second
    Then uncheck order 2
    Then pause for 1 second

  # verify fields in 1st order
    Then check order 1
    Then expect Order Details Ship From is correct
    Then expect Order Details service is PM Large Package
    Then pause for 1 second
    Then uncheck order 1
    Then pause for 1 second

  # verify fields in 2nd order
    Then check order 2
    Then expect Order Details Ship From is correct
    Then expect Order Details international service is PMI Package/Flat/Thick Envelope
    Then uncheck order 2
    Then sign out

  @bvt_printing
  Scenario:  BVT Printing
    Then add new order
    Then set order details ship-to to random address between zone 5 and 8
    Then set order details service to PM Package
    Then set order details ounces to 1
    Then set order details width to 1
    Then set order details length to 1
    Then set order details height to 1
    Then click orders toolbar print button
    Then set print modal print-on to Shipping Label - 8 ½" x 11" Paper
    Then click print modal print button
    Then sign out


  @bvt_purchasing
  Scenario: BVT Purchasing $10
    Then on Add Funds modal, purchase 10
    Then on Add Funds modal, click Purchase button
    Then Buy Mail Confirm Purchase: Expect text area contains, Please confirm your $10.00 postage purchase.
    Then Buy Mail Confirm Transction: Click Confirm button
    Then Buy Mail Purchase Approved: Expect text area contains, Your fund request for $10.00 has been approved.
    Then Buy Mail Purchase Approved: Click OK button
    Then Buy Mail: Expect customer balance increased by $10
    Then sign out
