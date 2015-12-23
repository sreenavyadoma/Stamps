Feature:  Service enabled/disabled tests

  Background:
    Given I am signed in to Orders

  @fcm_selection_enabled
  Scenario:  First Class Mail over 16 ounces disabled
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 17
    Then Expect Order details Service "First-Class Mail Large Envelope/Flat" to be disabled
    Then Expect Order details Service "First-Class Mail Package/Thick Envelope" to be disabled

    #First Class Mail up to 15.9 ounces enabled
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random zone 1 through 4
    Then Set Order Details Ounces to 15.9
    Then Expect Order details Service "First-Class Mail Package/Thick Envelope" to be enabled
    #Then Expect Order details Service "First-Class Mail Large Envelope/Flat" to be enabled


  @domestic_rules_validation
  Scenario: Domestic Rules Engine Validation
    And I Add a new order
    Then Set Order Details Email to bademail
    Then Set Orders Grid New Order ID to uncheck
    Then Set Orders Grid New Order ID to check
    Then Expect Order Details Domestic Address data error tooltip to be "Ship To address is required"
    Then Expect Order Details Domestic Email data error tooltip to be "Please enter a valid email address"
    Then Expect Order Details Domestic Weight lbs data error tooltip to be "Weight cannot be 0"
    Then Expect Order Details Domestic Weight oz data error tooltip to be "Weight cannot be 0"
    Then Expect Order Details Domestic Service data error tooltip to be "Service is required"
    Then Set Orders Grid New Order ID to check
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random,PO BOX 1257,Pohnpei, FM 96941-1257
    Then Set Order Details Email to random
    Then Set Order Details Phone to random
    Then Set Order Details Service to "Priority Mail Large Package"
    Then Set Order Details Pounds to 5
    Then Set Orders Grid New Order ID to uncheck
    Then Set Orders Grid New Order ID to check
    Then Set Order Details Length to 0
    Then Set Order Details Width to 0
    Then Set Order Details Height to 0
    #Then Expect Order Details Dimensions Length data error tooltip to be "Dimensions are required"
    #Then Expect Order Details Dimensions Width data error tooltip to be "Dimensions are required"
    #Then Expect Order Details Dimensions Height data error tooltip to be "Dimensions are required"

