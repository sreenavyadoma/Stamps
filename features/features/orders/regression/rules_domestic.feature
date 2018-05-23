Feature:  service enabled/disabled tests

  Background:
    Given a valid user is signed in to Web Apps

  @rules_domestic
  Scenario:  First Class Mail over 16 ounces disabled
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details ounces to 17
    Then expect Order Details service "FCM Package" is disabled
    Then expect Order Details service "First-Class Mail Package/Thick Envelope" is disabled

    #First Class Mail up to 15.9 ounces enabled
    Then add new order
    Then set order details ship-from to default
    Then set order details ship-to to random address between zone 1 and 4
    Then set order details ounces to 15.9
    Then expect Order Details service "First-Class Mail Package/Thick Envelope" is enabled
    #Then expect Order Details service "FCM Package" is enabled

  @rules_domestic
  Scenario: Domestic Rules Engine Validation
    Then add new order
    Then set order details email to bademail
    Then uncheck orders grid order id cached
    Then check orders grid order id cached
    Then expect Order Details Domestic Address data error tooltip is "Ship To address is required"
    Then expect Order Details Domestic Email data error tooltip is "Please enter a valid email address"
    Then expect order details weight Lbs data error tooltip is "Weight cannot be 0"
    Then expect order details weight Oz data error tooltip is "Weight cannot be 0"
    Then expect Order Details service data error tooltip is "Service is required"
    Then check orders grid order id cached
    Then set order details ship-from to default
    Then set order details ship-to to random,PO BOX 1257,Pohnpei, FM 96941-1257
    Then set order details email to random
    Then set order details phone to random
    Then set order details service to PM Large Package
    Then set order details pounds to 5
    Then uncheck orders grid order id cached
    Then check orders grid order id cached
    Then set order details length to 0
    Then set order details width to 0
    Then set order details height to 0
    #Then expect Order Details Dimensions Length data error tooltip is "Dimensions are required"
    #Then expect Order Details Dimensions Width data error tooltip is "Dimensions are required"
    #Then expect Order Details Dimensions Height data error tooltip is "Dimensions are required"

