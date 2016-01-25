
Feature: Local Rating Smoke Test

  Background:
    Given I am signed in to Orders as ff/qacc/auto34/326tsetaqcdS!

  @local_rating_smoke_test
  Scenario: Local Rating Smoke Test
    Then Add New Order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810-3116|Priority Mail Large/Thick Envelope|1|0|0|0|0|Signature Required|8.20|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810-3116|Priority Mail Large/Thick Envelope|0|8|0|0|0|USPS Tracking|5.75|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810-3116|Priority Mail Large/Thick Envelope|1|0|0|0|0|USPS Tracking|5.75|

