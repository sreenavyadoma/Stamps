Feature: Bulk Update Domestic

  Background:
    Given a valid user is signed in to Web Apps

    @bulk_update_dom
    Scenario: Bulk Update Domestic
      #Adding 1st order
        Then add Order 1
        Then set Order Details form Ship-From to default
        Then set Order Details form Ship-To to random address between zone 1 and 4
        Then set Order Details form service to PM Package
        Then set Order Details form Pounds to 1

      #Adding 2nd order
        Then add Order 2
        Then set Order Details form Ship-From to Bulk Update Order 2
        Then set Order Details form Ship-To to random address between zone 1 and 4
        Then set Order Details form service to PM Package
        Then set Order Details form Pounds to 1

        Then Refresh the browser

      #Check 1st two orders
        Then check Orders Grid row 1
        Then check Orders Grid row 2

      #Updating order details
        #Then set Multi Order Details Form Ship From to Bulk Update Order 1
        Then set Multi Order Details Form Domestic service to PME Package
        #Then set Multi Order Details Form Pounds to 2
        Then click Multi Order Form Update Orders button
        Then Pause for 2 seconds

        Then Refresh the browser

      #verify fields in 1st order
        Then check Orders Grid row 1
        #Then expect Order Details form Ship From is Bulk Update Order 1
        Then expect Order Details form Domestic service is PME Package
        #Then expect Order Details form Pound is 2
        Then uncheck Orders Grid row 1

      #verify fields in 2nd order
        Then check Orders Grid row 2
        #Then expect Order Details form Ship From is Bulk Update Order 1
        Then expect Order Details form Domestic service is PME Package
        #Then expect Order Details form Pound is 2

      Then Sign out