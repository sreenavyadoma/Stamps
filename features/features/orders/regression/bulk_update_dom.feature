Feature: Bulk Update Domestic

  Background:
    Given a valid user is signed in to Web Apps

  @bulk_update_dimensions
  Scenario: ORDERSAUTO-2261 Bulk Update: Dimensions controller

    #Adding 1st order
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 1
    Then set Order Details service to PM Package
    Then set Order Details Pounds to 1
    Then check order details insure-for checkbox
    Then set order details insure-for to $21.55
    Then expect order details insure-for is correct
    Then set order details insure-for to $0.00
    Then increment order details insure-for by 6
    Then expect order details insure-for is 6.00
    Then set order details insure-for to $0.00
    Then increment order details insure-for by 7
    Then expect order details insure-for is 7.00
    Then uncheck order details insure-for checkbox
    Then expect order details insure-for is 0.00
    Then expect Order Details Ship Cost Total is correct
    #Add 2nd order
    Then add order 2
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 8
    Then set Order Details service to PM Large Package
    Then set Order Details Pounds to 2
    Then set Order Details Ounces to 2
    Then set Order Details Length to 1
    Then set Order Details Width to 1
    Then set Order Details Height to 1

    #Check 1st two orders
    Then check order 1
    Then check order 2

    #Updating order details
    #Then set Bulk Update Ship From to default
    #todo-BulkUpdate missing expectation for Ship From

    #Then check row 1
    #Then check row 2
    Then set Bulk Update service to PME Package/Flat/Thick Envelope
    Then click Bulk Update Orders button

    Then uncheck row 2
    Then expect order details service is PME Package/Flat/Thick Envelope
    Then set order details service to PM Large Package

    Then check row 2
    Then set Bulk Update service to PME Padded Flat Rate Envelope
    Then click Bulk Update Orders button

    Then uncheck row 2
    Then set Bulk Update service to PME Package/Flat/Thick Envelope
    Then check row 2

    Then set Bulk Update Domestic service to PME Package/Flat/Thick Envelope
    Then click Bulk Update Orders button
    #todo-BulkUpdate missing expectation for Domestic service

    # set weight
    Then set Bulk Update Pounds to 1
    Then expect bulk update Pounds is correct
    Then set Bulk Update Ounces to 1
    Then expect bulk update Ounces is correct
    Then expect Bulk Update Weight is checked
    Then uncheck Bulk Update Weight
    Then expect Bulk Update Weight is unchecked
    Then check Bulk Update Weight
    Then expect Bulk Update Weight is checked
    #increment/decrement pounds
    Then set Bulk Update Pounds to 0
    Then increment bulk update pounds by 8
    Then decrement bulk update pounds by 8
    Then expect bulk update pounds is 0
    #increment/decrement Ounces
    Then set Bulk Update Ounces to 0
    Then increment bulk update Ounces by 8
    Then decrement bulk update Ounces by 8
    Then expect bulk update Ounces is 0

    #set dimensions
    Then set Bulk Update Length to 1
    Then set Bulk Update Width to 1
    Then set Bulk Update Height to 1
    Then expect Bulk Update Dimensions is checked
    Then uncheck Bulk Update Dimensions
    Then expect Bulk Update Dimensions is unchecked
    Then check Bulk Update Dimensions
    Then expect Bulk Update Dimensions is checked
    #increment/decrement length
    Then set bulk update length to 0
    Then increment bulk update length by 8
    Then expect bulk update length is 8
    Then decrement bulk update length by 8
    Then expect bulk update length is 0
    #increment/decrement width
    Then set bulk update width to 0
    Then increment bulk update width by 8
    Then expect bulk update width is 8
    Then decrement bulk update width by 8
    Then expect bulk update width is 0
    #increment/decrement height
    Then set bulk update height to 0
    Then increment bulk update height by 8
    Then expect bulk update height is 8
    Then decrement bulk update height by 8
    Then expect bulk update height is 0


    Then click Bulk Update Update Order button
    Then Pause for 2 seconds

    #Then Refresh the browser

    #verify fields in 1st order
    #Then check Orders Grid row 1
    #Then expect Order Details Ship From is correct
    #Then expect Orders Grid service is PME Package/Flat/Thick Envelope

    #Then uncheck order 1
    #Then uncheck order 2


    Then uncheck row 1
    And uncheck row 2



    #verify fields in 2nd order
    #Then check order 2
    #Then expect Order Details Ship From is correct
    #Then expect Orders Grid service is PME Package/Flat/Thick Envelope
    #Then expect Order Details Pound is 2

    Then Sign out

  @bulk_update_dom
  Scenario: Bulk Update Domestic
    #Adding 1st order
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 1
    Then set Order Details service to PM Package
    Then set Order Details Pounds to 1

    #Adding 2nd order
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 1
    Then set Order Details service to PM Package
    Then set Order Details Pounds to 1

    Then Refresh the browser

    #Check 1st two orders
    Then check Orders Grid row 1
    Then check Orders Grid row 2

    #Updating order details
    Then set Bulk Update Ship From to default
    Then set Bulk Update Domestic service to PME Package/Flat/Thick Envelope
    Then set Bulk Update Pounds to 1
    Then set Bulk Update Ounces to 1
    Then click Bulk Update Update Order button
    Then Pause for 2 seconds

    Then Refresh the browser

    #verify fields in 1st order
    Then check Orders Grid row 1
    Then expect Order Details Ship From is default
    Then expect Orders Grid service is PME Package/Flat/Thick Envelope
    #Then expect Order Details Pound is 2
    Then uncheck Orders Grid row 1

    #verify fields in 2nd order
    Then check Orders Grid row 2
    Then expect Order Details Ship From is correct
    Then expect Orders Grid service is PME Package/Flat/Thick Envelope
    #Then expect Order Details Pound is 2

    Then Sign out