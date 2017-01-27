Feature:  service enabled/disabled tests

  Background:
    Given a valid user is signed in to Web Apps

  @rules_domestic
  Scenario:  First Class Mail over 16 ounces disabled
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 17
    Then on Order Details form, expect service "FCM Package" is disabled
    Then on Order Details form, expect service "First-Class Mail Package/Thick Envelope" is disabled

    #First Class Mail up to 15.9 ounces enabled
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1 through 4
    Then on Order Details form, set Ounces to 15.9
    Then on Order Details form, expect service "First-Class Mail Package/Thick Envelope" is enabled
    #Then on Order Details form, expect service "FCM Package" is enabled

  @rules_domestic
  Scenario: Domestic Rules Engine Validation
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Email to bademail
    Then In Orders Grid, uncheck saved Order ID
    Then In Orders Grid, check saved Order ID
    Then on Order Details form, expect Domestic Address data error tooltip is "Ship To address is required"
    Then on Order Details form, expect Domestic Email data error tooltip is "Please enter a valid email address"
    Then on Order Details form, expect Weight Lbs data error tooltip is "Weight cannot be 0"
    Then on Order Details form, expect Weight Oz data error tooltip is "Weight cannot be 0"
    Then on Order Details form, expect service data error tooltip is "Service is required"
    Then In Orders Grid, check saved Order ID
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to Domestic Address random,PO BOX 1257,Pohnpei, FM 96941-1257
    Then on Order Details form, set Email to random
    Then on Order Details form, set Phone to random
    Then on Order Details form, select service PM Large Package
    Then on Order Details form, set Pounds to 5
    Then In Orders Grid, uncheck saved Order ID
    Then In Orders Grid, check saved Order ID
    Then on Order Details form, set Length to 0
    Then on Order Details form, set Width to 0
    Then on Order Details form, set Height to 0
    #Then on Order Details form, expect Dimensions Length data error tooltip is "Dimensions are required"
    #Then on Order Details form, expect Dimensions Width data error tooltip is "Dimensions are required"
    #Then on Order Details form, expect Dimensions Height data error tooltip is "Dimensions are required"

