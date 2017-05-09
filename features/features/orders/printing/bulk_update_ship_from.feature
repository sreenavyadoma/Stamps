
@multi_order_dialog_bulk_update
Feature: ORDERSAUTO-836 Bulk Update: Ship-From controller

  Background:
    Given a valid user is signed in to Web Apps

    @multi_order_dialog_bulk_update
    @bulk_update_ship_from
  Scenario: Bulk Update: Ship-From controller
    #Adding 1st order
    #Then add Order 1
    #Then set Order Details form Ship-From to Bulk Update Order 1
    #Then set Order Details form Ship-To to random address between zone 1 and 4
    #Then set Order Details form service to PM Package
    #Then set Order Details form Pounds to 1
    #Adding 2nd order
    #Then add Order 2
    #Then set Order Details form Ship-From to Bulk Update Order 2
    #Then set Order Details form Ship-To to random address between zone 1 and 4
    #Then set Order Details form service to PM Package
    #Then set Order Details form Pounds to 1
    #Check 1st two orders
    Then check Orders Grid row 1
    Then check Orders Grid row 2
    #Updating order details
    Then set Multi Order Details Form Ship From to Bulk Update Order 1
    #Then set Multi Order Details Form Pounds to 4
    #Then set Multi Order Details form Ounces to 7
    #Then set Multi Order Details Form Domestic service to PM Package
    #Then set Multi Order Details Form tracking to USPS Tracking
    #Then in Multi Order Form, click Update Orders button
    #validating updates

    #verify every fields in single order details for order 1 and order 2
   # Then expect Multi Order Ship From is Bulk Update Order 1
   # Then Form: Expect tracking is USPS Tracking
    Then Sign out

