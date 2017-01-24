Feature:  service enabled/disabled tests

  Background:
    Given A user is signed in to Orders

  @rules_domestic
  Scenario:  First Class Mail over 16 ounces disabled
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 17
    Then On Order Details form, expect service "FCM Package" is disabled
    Then On Order Details form, expect service "First-Class Mail Package/Thick Envelope" is disabled

    #First Class Mail up to 15.9 ounces enabled
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to address in Zone 1 through 4
    Then On Order Details form, set Ounces to 15.9
    Then On Order Details form, expect service "First-Class Mail Package/Thick Envelope" is enabled
    #Then On Order Details form, expect service "FCM Package" is enabled

  @rules_domestic
  Scenario: Domestic Rules Engine Validation
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Email to bademail
    Then In Orders Grid, uncheck saved Order ID
    Then In Orders Grid, check saved Order ID
    Then On Order Details form, expect Domestic Address data error tooltip is "Ship To address is required"
    Then On Order Details form, expect Domestic Email data error tooltip is "Please enter a valid email address"
    Then On Order Details form, expect Weight Lbs data error tooltip is "Weight cannot be 0"
    Then On Order Details form, expect Weight Oz data error tooltip is "Weight cannot be 0"
    Then On Order Details form, expect service data error tooltip is "Service is required"
    Then In Orders Grid, check saved Order ID
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address random,PO BOX 1257,Pohnpei, FM 96941-1257
    Then On Order Details form, set Email to random
    Then On Order Details form, set Phone to random
    Then On Order Details form, select service PM Large Package
    Then On Order Details form, set Pounds to 5
    Then In Orders Grid, uncheck saved Order ID
    Then In Orders Grid, check saved Order ID
    Then On Order Details form, set Length to 0
    Then On Order Details form, set Width to 0
    Then On Order Details form, set Height to 0
    #Then On Order Details form, expect Dimensions Length data error tooltip is "Dimensions are required"
    #Then On Order Details form, expect Dimensions Width data error tooltip is "Dimensions are required"
    #Then On Order Details form, expect Dimensions Height data error tooltip is "Dimensions are required"

