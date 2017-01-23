Feature:  Service enabled/disabled tests

  Background:
    Given I am signed in to Orders

  @rules_domestic
  Scenario:  First Class Mail over 16 ounces disabled
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 17
    Then Order Details: Expect Service "FCM Package" is disabled
    Then Order Details: Expect Service "First-Class Mail Package/Thick Envelope" is disabled

    #First Class Mail up to 15.9 ounces enabled
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 15.9
    Then Order Details: Expect Service "First-Class Mail Package/Thick Envelope" is enabled
    #Then Order Details: Expect Service "FCM Package" is enabled

  @rules_domestic
  Scenario: Domestic Rules Engine Validation
    Then Orders Toolbar: Add
    Then Order Details: Set Email to bademail
    Then Orders Grid: Uncheck Saved Order ID
    Then Orders Grid: Check saved Order ID
    Then Order Details: Expect Domestic Address data error tooltip is "Ship To address is required"
    Then Order Details: Expect Domestic Email data error tooltip is "Please enter a valid email address"
    Then Order Details: Expect Weight Lbs data error tooltip is "Weight cannot be 0"
    Then Order Details: Expect Weight Oz data error tooltip is "Weight cannot be 0"
    Then Order Details: Expect Service data error tooltip is "Service is required"
    Then Orders Grid: Check saved Order ID
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Domestic Address random,PO BOX 1257,Pohnpei, FM 96941-1257
    Then Order Details: Set Email to random
    Then Order Details: Set Phone to random
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Pounds to 5
    Then Orders Grid: Uncheck Saved Order ID
    Then Orders Grid: Check saved Order ID
    Then Order Details: Set Length to 0
    Then Order Details: Set Width to 0
    Then Order Details: Set Height to 0
    #Then Order Details: Expect Dimensions Length data error tooltip is "Dimensions are required"
    #Then Order Details: Expect Dimensions Width data error tooltip is "Dimensions are required"
    #Then Order Details: Expect Dimensions Height data error tooltip is "Dimensions are required"

