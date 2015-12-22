
Feature: Local Rating Smoke Test

  Background:
    Given I am signed in to Orders as ff/qacc/auto40/326tsetaqcdS!

  @local_rating_smoke_test
  Scenario: Zone 1 - Priority Mail Large/Thick Envelope
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810-3116|Priority Mail Large/Thick Envelope|1|0|1|1|1|Signature Required|8.2|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810-3116|Priority Mail Large/Thick Envelope|0|8|2|2|2|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810-3116|Priority Mail Large/Thick Envelope|1|0|2|2|2|USPS Tracking|5.05|