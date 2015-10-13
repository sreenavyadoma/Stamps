
Feature: Local Rating Zone 1
  The automated tests should use the three from addresses in the "Zones" tab to test each of the 9 postal zones for accuracy.
  Ratesets CBP, CPP and the most common of the SAS rates should be tested.


  Scenario Outline:  As a batch shipper, I want to be able to change my print media
    Then I am signed in as a batch shipper ie/qacc/dj_cctest-01/postage1
    Then I Add a new order
    Then Set single-order form Ship-From to <ship_from>
    Then Set single-order form Ship-To address to <ship_to>
    Then Set single-order form Service to "<service>"
    Then Set single-order form Pounds to <weight_lbs>
    Then Set single-order form Ounces to <weight_oz>
    Then Set single-order form Length to <length>
    Then Set single-order form Height to <height>
    Then Set single-order form Width to <width>
    Then Set single-order form Tracking to <tracking>
    Then Expect single-order form Total to be $<total>

    Examples:
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810|Priority Mail Large/Thick Envelope|1|0|0|0|0|Signature Required|7.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810|Priority Mail Large/Thick Envelope|1|0|0|0|0|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810|Priority Mail Large/Thick Envelope|2|0|0|0|0|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810|Priority Mail Large/Thick Envelope|3|0|0|0|0|USPS Tracking|5.49|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810|Priority Mail Large/Thick Envelope|4|0|0|0|0|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810|Priority Mail Large/Thick Envelope|5|0|0|0|0|USPS Tracking|6.78|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St, Long Beach CA 90810|Priority Mail Large/Thick Envelope|6|0|0|0|0|USPS Tracking|6.95|