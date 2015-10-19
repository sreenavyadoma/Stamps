Feature: Test Development

  Background:
    Given I am signed in as a batch shipper

  @local_rating_rob
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|1|0|0|0|0|Signature Required|7.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|1|0|0|0|0|USPS Tracking|5.35|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|2|0|0|0|0|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|3|0|0|0|0|USPS Tracking|5.49|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|4|0|0|0|0|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|5|0|0|0|0|USPS Tracking|6.78|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|6|0|0|0|0|USPS Tracking|6.95|

