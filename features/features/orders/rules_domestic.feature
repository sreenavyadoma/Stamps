Feature:  Service enabled/disabled tests

  Background:
    Given I am signed in to Orders

  @fcm_selection_enabled
  Scenario:  First Class Mail over 16 ounces disabled
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Ounces to 17
    Then Expect Order details Service "First-Class Mail Large Envelope/Flat" to be disabled
    Then Expect Order details Service "First-Class Mail Package/Thick Envelope" to be disabled

    #First Class Mail up to 15.9 ounces enabled
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details: Set Ounces to 15.9
    Then Expect Order details Service "First-Class Mail Package/Thick Envelope" to be enabled
    #Then Expect Order details Service "First-Class Mail Large Envelope/Flat" to be enabled

  @domestic_rules_validation
  Scenario: Domestic Rules Engine Validation
    Then Add New Order
    Then Order Details: Set Email to bademail
    Then Set Orders Grid New Order ID to uncheck
    Then Set Orders Grid New Order ID to check
    Then Expect Order Details Domestic Address data error tooltip to be "Ship To address is required"
    Then Expect Order Details Domestic Email data error tooltip to be "Please enter a valid email address"
    Then Expect Order Details Weight Lbs data error tooltip to be "Weight cannot be 0"
    Then Expect Order Details Weight Oz data error tooltip to be "Weight cannot be 0"
    Then Expect Order Details Service data error tooltip to be "Service is required"
    Then Set Orders Grid New Order ID to check
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To address to random,PO BOX 1257,Pohnpei, FM 96941-1257
    Then Order Details: Set Email to random
    Then Order Details: Set Phone to random
    Then Order Details: Set Service to "Priority Mail Large Package"
    Then Order Details: Set Pounds to 5
    Then Set Orders Grid New Order ID to uncheck
    Then Set Orders Grid New Order ID to check
    Then Order Details: Set Length to 0
    Then Order Details: Set Width to 0
    Then Order Details: Set Height to 0
    #Then Expect Order Details Dimensions Length data error tooltip to be "Dimensions are required"
    #Then Expect Order Details Dimensions Width data error tooltip to be "Dimensions are required"
    #Then Expect Order Details Dimensions Height data error tooltip to be "Dimensions are required"

