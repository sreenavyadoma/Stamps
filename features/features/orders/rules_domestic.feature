Feature:  service enabled/disabled tests

  Background:
    Given a valid user is signed in to Web Apps

  @rules_domestic
  Scenario:  First Class Mail over 16 ounces disabled
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 17
    Then expect Order Details form service "FCM Package" is disabled
    Then expect Order Details form service "First-Class Mail Package/Thick Envelope" is disabled

    #First Class Mail up to 15.9 ounces enabled
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then set Order Details form Ounces to 15.9
    Then expect Order Details form service "First-Class Mail Package/Thick Envelope" is enabled
    #Then expect Order Details form service "FCM Package" is enabled

  @rules_domestic
  Scenario: Domestic Rules Engine Validation
    Then in Orders Toolbar, click Add button
    Then set Order Details form Email to bademail
    Then in Orders Grid, uncheck saved Order ID
    Then in Orders Grid, check saved Order ID
    Then expect Order Details form Domestic Address data error tooltip is "Ship To address is required"
    Then expect Order Details form Domestic Email data error tooltip is "Please enter a valid email address"
    Then expect Order Details form Weight Lbs data error tooltip is "Weight cannot be 0"
    Then expect Order Details form Weight Oz data error tooltip is "Weight cannot be 0"
    Then expect Order Details form service data error tooltip is "Service is required"
    Then in Orders Grid, check saved Order ID
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random,PO BOX 1257,Pohnpei, FM 96941-1257
    Then set Order Details form Email to random
    Then set Order Details form Phone to random
    Then on Order Details form, select service PM Large Package
    Then set Order Details form Pounds to 5
    Then in Orders Grid, uncheck saved Order ID
    Then in Orders Grid, check saved Order ID
    Then set Order Details form Length to 0
    Then set Order Details form Width to 0
    Then set Order Details form Height to 0
    #Then expect Order Details form Dimensions Length data error tooltip is "Dimensions are required"
    #Then expect Order Details form Dimensions Width data error tooltip is "Dimensions are required"
    #Then expect Order Details form Dimensions Height data error tooltip is "Dimensions are required"

