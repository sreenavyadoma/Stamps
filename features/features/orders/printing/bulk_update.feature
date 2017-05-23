
@multi_order_dialog_bulk_update
Feature: ORDERSAUTO-836 Bulk Update: Ship-From controller

  Background:
    Given a valid user is signed in to Web Apps

    @bulk_update
    Scenario: Bulk Update: Ship-From controller
      #Adding 1st order
      Then add Order 1
      Then set Order Details form Ship-From to default
      Then set Order Details form Ship-To to random address between zone 1 and 4
      Then set Order Details form service to PM Package
      Then set Order Details form Pounds to 1

      #Adding 2nd order
      Then add Order 2
      Then set Order Details form Ship-From to default
      Then set Order Details form Ship-To to random address between zone 1 and 4
      Then set Order Details form service to PSG Package
      Then set Order Details form Pounds to 1

      #Check 1st two orders
      Then check Orders Grid row 1
      Then check Orders Grid row 2

      #Updating order details
      Then set Multi Order Details Form Ship From to Bulk Update Order 1
      Then set Multi Order Details Form Domestic service to PME Package
      Then set Multi Order Details form Pounds to 3
      Then in Multi Order Form, click Update Orders button
      Then Pause for 2 seconds
      Then Refresh the browser

      #verify fields in first order
      Then check Orders Grid row 1
      Then expect Order Details form Ship From is Bulk Update Order 1 - El Segundo, CA
      Then expect Order Details form Domestic service is PME Package/Flat/Thick Envelope (1-2 Days)
      Then expect Order Details form Pound is 3

      #verify fields in 2nd order
      Then check Orders Grid row 2
      Then expect Order Details form Ship From is Bulk Update Order 1 - El Segundo, CA
      Then expect Order Details form Domestic service is PME Package/Flat/Thick Envelope (1-2 Days)
      Then expect Order Details form Pound is 3

      #verify fields in Multi order details for order 1 and order 2
      Then Refresh the browser
      Then check Orders Grid row 1
      Then check Orders Grid row 2
      Then expect Order Details form Ship From is Bulk Update Order 1 - El Segundo, CA
      Then expect Order Details form Domestic service is PME Package/Flat/Thick Envelope (1-2 Days)
      Then expect Order Details form Pound is 3

      Then Sign out

