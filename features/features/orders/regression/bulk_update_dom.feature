Feature: Bulk Update Domestic

  Background:
    Given a valid user is signed in to Web Apps

  @bulk_update_int_services
  Scenario: ORDERSAUTO-2261 Bulk Update: Dimensions controller

    # Adding 1st order
#    Then add new order
#    #Then set Order Details Ship-From to default
#    Then set Order Details Ship-To International address to
#      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country   | phone   |  email  |
#      | PMEI LFRE |  8.5x11 Left Side | random       | random           | random | random  | M12345      | Canada | random  | random  |
#    Then set order details service to PMI Package/Flat/Thick Envelope
#    Then set Order Details Weight to 2 lb 2 oz
#    Then on order details form, add item 1, qty 1, id ID 1, description Description 1
#    #Then on order details form, add item 2, qty 2, id random string, description random string
#    Then click Order Details form Customs Form button
#
#    Then add Customs Associated Item 1, description random string, qty 1, Price 1, Made In Canada, Tariff 1
#    Then add Customs Associated Item 2, description random string, qty 1, Price 1, Made In Japan, Tariff 1
#    Then add Customs Associated Item 3, description random string, qty 1, Price 1, Made In Canada, Tariff 1
#    Then add Customs Associated Item 4, description random string, qty 1, Price 1, Made In Japan, Tariff 1
#    Then add Customs Associated Item 5, description random string, qty 1, Price 1, Made In Canada, Tariff 1
#    Then add Customs Associated Item 6, description random string, qty 1, Price 1, Made In Japan, Tariff 1
#    Then add Customs Associated Item 7, description random string, qty 1, Price 1, Made In Canada, Tariff 1
#    Then add Customs Associated Item 1, description random string, qty 2, Price 2, Made In United States, Tariff 2

#    Then check Customs form I agree to the USPS Privacy Act Statement
#    Then close Customs Information form

    # Add 2nd order
#    Then add order 2
#    #Then set Order Details Ship-From to default
#    Then set Order Details Ship-To to random address between zone 8
#    Then set order details service to PM Large Package
#    Then set order details pounds to 2
#    Then set order details ounces to 2
#    Then set order details length to 1
#    Then set order details width to 1
#    Then set order details height to 1



#    Then check Customs form I agree to the USPS Privacy Act Statement
#    Then close Customs Information form

    # Check 1st two orders
#    Then check order 1
#    Then check order 2







    Then add order 1
    Then set Order Details Domestic Ship-To Country to Canada
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
    Then set Order Details Domestic Ship-To Country to Canada
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
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 1
    Then set order details service to PM Package
    Then set order details pounds to 1
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


    Then click bulk update update order button
    Then pause for 2 seconds

    #Then Refresh the driver

    #verify fields in 1st order
    #Then check Orders Grid row 1
    #Then expect Order Details Ship From is correct
    #Then expect orders grid service is PME Package/Flat/Thick Envelope

    #Then uncheck order 1
    #Then uncheck order 2


    Then uncheck row 1
    And uncheck row 2



    #verify fields in 2nd order
    #Then check order 2
    #Then expect Order Details Ship From is correct
    #Then expect orders grid service is PME Package/Flat/Thick Envelope
    #Then expect order details pound is 2

    Then sign out

  @bulk_update_dom
  Scenario: Bulk Update Domestic
    #Adding 1st order
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 1
    Then set order details service to PM Package
    Then set order details pounds to 1

    #Adding 2nd order
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address in zone 1
    Then set order details service to PM Package
    Then set order details pounds to 1

    Then Refresh the driver

    #Check 1st two orders
    Then check Orders Grid row 1
    Then check Orders Grid row 2

    #Updating order details
    Then set bulk update ship from to default
    Then set bulk update domestic service to PME Package/Flat/Thick Envelope
    Then set Bulk Update Pounds to 1
    Then set Bulk Update Ounces to 1
    Then click bulk update update order button
    Then pause for 2 seconds

    Then Refresh the driver

    #verify fields in 1st order
    Then check Orders Grid row 1
    Then expect Order Details Ship From is default
    Then expect orders grid service is PME Package/Flat/Thick Envelope
    #Then expect order details pound is 2
    Then uncheck Orders Grid row 1

    #verify fields in 2nd order
    Then check Orders Grid row 2
    Then expect Order Details Ship From is correct
    Then expect orders grid service is PME Package/Flat/Thick Envelope
    #Then expect order details pound is 2

    Then sign out