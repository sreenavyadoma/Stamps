Feature: Bulk Update Domestic

  Background:
    Given a valid user is signed in to Web Apps

  @bulk_update_int_services
  Scenario: ORDERSAUTO-2261 Bulk Update: Dimensions controller

    # Adding 1st order
#    Then add new order
#    #Then set order details ship-from to Automation - El Segundo, CA
#    Then set order details ship-to international address to
#      | full_name   | company | street_address1 | street_address2 | city   | province| postal_code | country   | phone   |  email  |
#      | PMEI LFRE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
#    Then set order details service to PMI Package/Flat/Thick Envelope
#    Then set order details weight to 2 lb 2 oz
#    Then add order details item 1, qty 1, id ID 1, description Description 1
#    #Then add order details item 2, qty 2, id random string, description random string
#    Then click order details form customs form button
#
#    Then add customs associated item 1, description random string, qty 1, Price 1, Made In Canada, Tariff 1
#    Then add customs associated item 2, description random string, qty 1, Price 1, Made In Japan, Tariff 1
#    Then add customs associated item 3, description random string, qty 1, Price 1, Made In Canada, Tariff 1
#    Then add customs associated item 4, description random string, qty 1, Price 1, Made In Japan, Tariff 1
#    Then add customs associated item 5, description random string, qty 1, Price 1, Made In Canada, Tariff 1
#    Then add customs associated item 6, description random string, qty 1, Price 1, Made In Japan, Tariff 1
#    Then add customs associated item 7, description random string, qty 1, Price 1, Made In Canada, Tariff 1
#    Then add customs associated item 1, description random string, qty 2, Price 2, Made In United States, Tariff 2

#    Then check customs form i agree to the usps privacy act statement
#    Then close customs information form

    # Add 2nd order
#    Then add order 2
#    #Then set order details ship-from to Automation - El Segundo, CA
#    Then set order details ship-to to random address between zone 8
#    Then set order details service to PM Large Package
#    Then set order details pounds to 2
#    Then set order details ounces to 2
#    Then set order details length to 1
#    Then set order details width to 1
#    Then set order details height to 1



#    Then check customs form i agree to the usps privacy act statement
#    Then close customs information form

    # Check 1st two orders
#    Then check order 1
#    Then check order 2







    Then add order 1
    Then set order details domestic ship-to country to Canada
    Then set order details service to PMI Package/Flat/Thick Envelope

    Then add order 2
    Then set order details service to PM Large Package

    Then check order 1
    Then check order 2

    Then expect bulk update is present

    Then set bulk update international service to FCMI Large Envelope/Flat
    Then set bulk update domestic service to PME Padded Flat Rate Envelope

    Then click Bulk Update Orders button

    Then uncheck order 1
    Then uncheck order 2

    Then check order 1
    Then expect order details service is FCMI Large Envelope/Flat
    Then set order details service to PMI Package/Flat/Thick Envelope

    Then uncheck order 1

    Then check order 2
    Then expect order details service is PME Padded Flat Rate Envelope
    Then set order details service to PM Large Package




    Then add order 3
    Then set order details service to PM Large Package

    Then add order 4
    Then set order details domestic ship-to country to Canada
    Then set order details service to PMI Package/Flat/Thick Envelope


    Then check order 3
    Then check order 4
    Then expect bulk update is present

    Then set bulk update international service to FCMI Large Envelope/Flat
    Then set bulk update domestic service to PME Padded Flat Rate Envelope

    Then click Bulk Update Orders button

    Then uncheck order 3
    Then uncheck order 4

    Then check order 3
    Then expect order details service is PME Padded Flat Rate Envelope
    Then set order details service to PM Large Package

    Then uncheck order 3
    Then check order 4
    Then expect order details service is FCMI Large Envelope/Flat
    Then set order details service to PMI Package/Flat/Thick Envelope



    Then sign out

  @bulk_update_dimensions
  Scenario: ORDERSAUTO-2261 Bulk Update: Dimensions controller

    #Adding 1st order
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Package
    Then set order details pounds to 1
    Then check order details insure-for checkbox
    Then set order details insure-for to 21.55
    Then expect order details insure-for is correct
    Then set order details insure-for to 0.00
    Then increment order details insure-for by 6
    Then expect order details insure-for is 6.00
    Then set order details insure-for to 0.00
    Then increment order details insure-for by 7
    Then expect order details insure-for is 7.00
    Then uncheck order details insure-for checkbox
    Then expect order details insure-for is 0.00
    Then expect Order Details Ship Cost Total is correct
    #Add 2nd order
    Then add order 2
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address between zone 8
    Then set order details service to PM Large Package
    Then set order details pounds to 2
    Then set order details ounces to 2
    Then set order details length to 1
    Then set order details width to 1
    Then set order details height to 1

    #Check 1st two orders
    Then check order 1
    Then check order 2

    #Updating order details
    #Then set bulk update ship from to default
    #todo-BulkUpdate missing expectation for Ship From

    #Then check row 1
    #Then check row 2
    Then set bulk update domestic service to PME Package/Flat/Thick Envelope
    Then click Bulk Update Orders button

    Then uncheck row 2
    Then expect order details service is PME Package/Flat/Thick Envelope
    Then set order details service to PM Large Package

    Then check row 2
    Then set bulk update domestic service to PME Padded Flat Rate Envelope
    Then expect bulk update international service is PME Padded Flat Rate Envelope

    Then uncheck row 2
    Then set bulk update domestic service to PME Package/Flat/Thick Envelope
    Then check row 2

    Then set bulk update domestic service to PME Package/Flat/Thick Envelope
    Then click Bulk Update Orders button
    #todo-BulkUpdate missing expectation for Domestic service

    # set weight
    Then set Bulk Update Pounds to 1
    Then expect bulk update pounds is correct
    Then set bulk update ounces to 1
    Then expect bulk update Ounces is correct
    Then expect bulk update weight is checked
    Then uncheck bulk update weight
    Then expect bulk update weight is unchecked
    Then check bulk update weight
    Then expect bulk update weight is checked
    #increment/decrement pounds
    Then set Bulk Update Pounds to 0
    Then increment bulk update pounds by 8
    Then decrement bulk update pounds by 8
    Then expect bulk update pounds is 0
    #increment/decrement Ounces
    Then set bulk update ounces to 0
    Then increment bulk update ounces by 8
    Then decrement bulk update ounces by 8
    Then expect bulk update Ounces is 0

    #set dimensions
    Then set bulk update length to 1
    Then set bulk update width to 1
    Then set bulk update height to 1
    Then expect bulk update dimensions is checked
    Then uncheck bulk update dimensions
    Then expect bulk update dimensions is unchecked
    Then check bulk update dimensions
    Then expect bulk update dimensions is checked
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


    Then click bulk update update order button
    Then pause for 2 seconds

    #Then refresh the browser

    #verify fields in 1st order
    #Then check row 1
    #Then expect order details ship from is correct
    #Then expect orders grid service is correct

    #Then uncheck order 1
    #Then uncheck order 2


    Then uncheck row 1
    And uncheck row 2



    #verify fields in 2nd order
    #Then check order 2
    #Then expect order details ship from is correct
    #Then expect orders grid service is correct
    #Then expect order details pound is 2

    Then sign out

  @bulk_update_dom
  Scenario: Bulk Update Domestic
    #Adding 1st order
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Package
    Then set order details pounds to 1

    #Adding 2nd order
    Then add new order
    Then set order details ship-from to Automation - El Segundo, CA
    Then set order details ship-to to random address in zone 1
    Then set order details service to PM Package
    Then set order details pounds to 1

    Then refresh the browser

    #Check 1st two orders
    Then check row 1
    Then check row 2

    #Updating order details
    Then set bulk update ship from to default
    Then set bulk update domestic service to PME Package/Flat/Thick Envelope
    Then set Bulk Update Pounds to 1
    Then set bulk update ounces to 1
    Then click bulk update update order button
    Then pause for 2 seconds

    Then refresh the browser

    #verify fields in 1st order
    Then check row 1
    Then expect order details ship from is default
    Then expect orders grid service is correct
    #Then expect order details pound is 2
    Then uncheck row 1

    #verify fields in 2nd order
    Then check row 2
    Then expect order details ship from is correct
    Then expect orders grid service is correct
    #Then expect order details pound is 2

    Then sign out