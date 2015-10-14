
Feature: Local Rating Zone 1
  The automated tests should use the three from addresses in the "Zones" tab to test each of the 9 postal zones for accuracy.
  Ratesets CBP, CPP and the most common of the SAS rates should be tested.

  Background:
    Given I am signed in as a batch shipper ff/qacc/auto05/password1

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|1|0|1|1|1|Signature Required|7.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|0|8|2|2|2|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|1|0|2|2|2|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|2|0|3|3|3|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|3|0|4|4|4|USPS Tracking|5.49|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|4|0|5|5|5|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|5|0|6|6|6|USPS Tracking|6.78|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|6|0|7|7|7|USPS Tracking|6.95|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|7|0|8|8|8|USPS Tracking|7.27|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|8|0|9|9|9|USPS Tracking|7.54|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|9|0|10|10|10|USPS Tracking|8.02|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|10|0|11|11|11|USPS Tracking|8.28|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|11|0|12|12|12|USPS Tracking|8.57|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|12|0|1|1|1|USPS Tracking|8.78|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|13|0|2|2|2|USPS Tracking|8.99|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|14|0|3|3|3|USPS Tracking|9.14|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|15|0|4|4|4|USPS Tracking|9.27|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|16|0|5|5|5|USPS Tracking|9.77|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|17|0|6|6|6|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|18|0|7|7|7|USPS Tracking|9.96|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|19|0|8|8|8|USPS Tracking|10.08|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|20|0|9|9|9|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|21|0|10|10|10|USPS Tracking|11.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|22|0|11|11|11|USPS Tracking|13.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|23|0|12|12|12|USPS Tracking|14.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|24|0|1|1|1|USPS Tracking|16.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|25|0|2|2|2|USPS Tracking|17.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|26|0|3|3|3|USPS Tracking|18.77|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|27|0|4|4|4|USPS Tracking|19.31|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|28|0|5|5|5|USPS Tracking|19.90|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|29|0|6|6|6|USPS Tracking|20.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|30|0|7|7|7|USPS Tracking|21.13|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|31|0|8|8|8|USPS Tracking|21.71|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|32|0|9|9|9|USPS Tracking|21.96|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|33|0|10|10|10|USPS Tracking|22.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|34|0|11|11|11|USPS Tracking|22.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|35|0|12|12|12|USPS Tracking|22.77|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|36|0|1|1|1|USPS Tracking|23.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|37|0|2|2|2|USPS Tracking|23.29|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|38|0|3|3|3|USPS Tracking|23.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|39|0|4|4|4|USPS Tracking|23.75|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|40|0|5|5|5|USPS Tracking|23.99|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|41|0|6|6|6|USPS Tracking|24.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|42|0|7|7|7|USPS Tracking|24.43|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|43|0|8|8|8|USPS Tracking|24.71|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|44|0|9|9|9|USPS Tracking|24.87|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|45|0|10|10|10|USPS Tracking|25.04|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|46|0|11|11|11|USPS Tracking|25.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|47|0|12|12|12|USPS Tracking|25.46|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|48|0|1|1|1|USPS Tracking|25.66|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|49|0|2|2|2|USPS Tracking|25.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|50|0|3|3|3|USPS Tracking|25.96|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|51|0|4|4|4|USPS Tracking|26.34|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|52|0|5|5|5|USPS Tracking|26.75|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|53|0|6|6|6|USPS Tracking|27.23|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|54|0|7|7|7|USPS Tracking|27.63|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|55|0|8|8|8|USPS Tracking|28.06|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|56|0|9|9|9|USPS Tracking|28.45|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|57|0|10|10|10|USPS Tracking|28.90|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|58|0|11|11|11|USPS Tracking|29.33|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|59|0|12|12|12|USPS Tracking|29.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|60|0|1|1|1|USPS Tracking|30.14|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|61|0|2|2|2|USPS Tracking|30.61|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|62|0|3|3|3|USPS Tracking|30.99|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|63|0|4|4|4|USPS Tracking|31.54|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|64|0|5|5|5|USPS Tracking|31.83|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|65|0|6|6|6|USPS Tracking|32.29|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|66|0|7|7|7|USPS Tracking|32.72|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|67|0|8|8|8|USPS Tracking|33.20|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|68|0|9|9|9|USPS Tracking|33.59|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|69|0|10|10|10|USPS Tracking|34.06|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|70|0|11|11|11|USPS Tracking|34.41|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large/Thick Envelope|71|0|12|12|12|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|1|0|13|12|12|Signature Required|7.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|0|8|2|2|2|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|1|0|13|12|12|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|2|0|13|13|12|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|3|0|13|13|13|USPS Tracking|5.49|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|4|0|14|13|13|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|5|0|14|14|13|USPS Tracking|6.78|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|6|0|14|14|14|USPS Tracking|6.95|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|7|0|15|14|14|USPS Tracking|7.27|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|8|0|15|15|14|USPS Tracking|7.54|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|9|0|15|15|15|USPS Tracking|8.02|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|10|0|16|15|15|USPS Tracking|8.28|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|11|0|16|16|15|USPS Tracking|8.57|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|12|0|16|16|16|USPS Tracking|8.78|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|13|0|17|16|16|USPS Tracking|8.99|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|14|0|17|17|16|USPS Tracking|9.14|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|15|0|4|4|4|USPS Tracking|9.27|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|16|0|5|5|5|USPS Tracking|9.77|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|17|0|6|6|6|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|18|0|7|7|7|USPS Tracking|9.96|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|19|0|8|8|8|USPS Tracking|10.08|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|20|0|9|9|9|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|21|0|10|10|10|USPS Tracking|11.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|22|0|11|11|11|USPS Tracking|13.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|23|0|12|12|12|USPS Tracking|14.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|24|0|1|1|1|USPS Tracking|16.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|25|0|2|2|2|USPS Tracking|17.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|26|0|3|3|3|USPS Tracking|18.77|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|27|0|4|4|4|USPS Tracking|19.31|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|28|0|5|5|5|USPS Tracking|19.90|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|29|0|6|6|6|USPS Tracking|20.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|30|0|7|7|7|USPS Tracking|21.13|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|31|0|8|8|8|USPS Tracking|21.71|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|32|0|9|9|9|USPS Tracking|21.96|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|33|0|10|10|10|USPS Tracking|22.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|34|0|11|11|11|USPS Tracking|22.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|35|0|12|12|12|USPS Tracking|22.77|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|36|0|1|1|1|USPS Tracking|23.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|37|0|2|2|2|USPS Tracking|23.29|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|38|0|3|3|3|USPS Tracking|23.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|39|0|4|4|4|USPS Tracking|23.75|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|40|0|5|5|5|USPS Tracking|23.99|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|41|0|6|6|6|USPS Tracking|24.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|42|0|7|7|7|USPS Tracking|24.43|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|43|0|8|8|8|USPS Tracking|24.71|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|44|0|9|9|9|USPS Tracking|24.87|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|45|0|10|10|10|USPS Tracking|25.04|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|46|0|11|11|11|USPS Tracking|25.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|47|0|12|12|12|USPS Tracking|25.46|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|48|0|1|1|1|USPS Tracking|25.66|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|49|0|2|2|2|USPS Tracking|25.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|50|0|3|3|3|USPS Tracking|25.96|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|51|0|4|4|4|USPS Tracking|26.34|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|52|0|5|5|5|USPS Tracking|26.75|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|53|0|6|6|6|USPS Tracking|27.23|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|54|0|7|7|7|USPS Tracking|27.63|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|55|0|8|8|8|USPS Tracking|28.06|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|56|0|9|9|9|USPS Tracking|28.45|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|57|0|10|10|10|USPS Tracking|28.90|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|58|0|11|11|11|USPS Tracking|29.33|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|59|0|12|12|12|USPS Tracking|29.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|60|0|1|1|1|USPS Tracking|30.14|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|61|0|2|2|2|USPS Tracking|30.61|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|62|0|3|3|3|USPS Tracking|30.99|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|63|0|4|4|4|USPS Tracking|31.54|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|64|0|5|5|5|USPS Tracking|31.83|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|65|0|6|6|6|USPS Tracking|32.29|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|66|0|7|7|7|USPS Tracking|32.72|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|67|0|8|8|8|USPS Tracking|33.20|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|68|0|9|9|9|USPS Tracking|33.59|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|69|0|10|10|10|USPS Tracking|34.06|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|70|0|11|11|11|USPS Tracking|34.41|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Package|71|0|12|12|12|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|1|0|1|1|1|Signature Required|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|1|0|2|2|2|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|2|0|3|3|3|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|3|0|4|4|4|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|4|0|5|5|5|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|5|0|6|6|6|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|6|0|7|7|7|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|7|0|8|8|8|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|8|0|9|9|9|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|9|0|10|10|10|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|10|0|11|11|11|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|11|0|12|12|12|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|12|0|1|1|1|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|13|0|2|2|2|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|14|0|3|3|3|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|15|0|4|4|4|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|16|0|5|5|5|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|17|0|6|6|6|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|18|0|7|7|7|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|19|0|8|8|8|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|20|0|9|9|9|USPS Tracking|10.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|21|0|10|10|10|USPS Tracking|11.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|22|0|11|11|11|USPS Tracking|13.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|23|0|12|12|12|USPS Tracking|14.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|24|0|1|1|1|USPS Tracking|16.26|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|25|0|2|2|2|USPS Tracking|17.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|26|0|3|3|3|USPS Tracking|18.77|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|27|0|4|4|4|USPS Tracking|19.31|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|28|0|5|5|5|USPS Tracking|19.90|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|29|0|6|6|6|USPS Tracking|20.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|30|0|7|7|7|USPS Tracking|21.13|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|31|0|8|8|8|USPS Tracking|21.71|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|32|0|9|9|9|USPS Tracking|21.96|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|33|0|10|10|10|USPS Tracking|22.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|34|0|11|11|11|USPS Tracking|22.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|35|0|12|12|12|USPS Tracking|22.77|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|36|0|1|1|1|USPS Tracking|23.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|37|0|2|2|2|USPS Tracking|23.29|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|38|0|3|3|3|USPS Tracking|23.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|39|0|4|4|4|USPS Tracking|23.75|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|40|0|5|5|5|USPS Tracking|23.99|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|41|0|6|6|6|USPS Tracking|24.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|42|0|7|7|7|USPS Tracking|24.43|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|43|0|8|8|8|USPS Tracking|24.71|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|44|0|9|9|9|USPS Tracking|24.87|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|45|0|10|10|10|USPS Tracking|25.04|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|46|0|11|11|11|USPS Tracking|25.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|47|0|12|12|12|USPS Tracking|25.46|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|48|0|1|1|1|USPS Tracking|25.66|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|49|0|2|2|2|USPS Tracking|25.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|50|0|3|3|3|USPS Tracking|25.96|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|51|0|4|4|4|USPS Tracking|26.34|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|52|0|5|5|5|USPS Tracking|26.75|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|53|0|6|6|6|USPS Tracking|27.23|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|54|0|7|7|7|USPS Tracking|27.63|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|55|0|8|8|8|USPS Tracking|28.06|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|56|0|9|9|9|USPS Tracking|28.45|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|57|0|10|10|10|USPS Tracking|28.90|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|58|0|11|11|11|USPS Tracking|29.33|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|59|0|12|12|12|USPS Tracking|29.76|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|60|0|1|1|1|USPS Tracking|30.14|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|61|0|2|2|2|USPS Tracking|30.61|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|62|0|3|3|3|USPS Tracking|30.99|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|63|0|4|4|4|USPS Tracking|31.54|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|64|0|5|5|5|USPS Tracking|31.83|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|65|0|6|6|6|USPS Tracking|32.29|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|66|0|7|7|7|USPS Tracking|32.72|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|67|0|8|8|8|USPS Tracking|33.20|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|68|0|9|9|9|USPS Tracking|33.59|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|69|0|10|10|10|USPS Tracking|34.06|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|70|0|11|11|11|USPS Tracking|34.41|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Package|71|0|12|12|12|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|1|0|1|1|1|Signature Required|7.77|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|1|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|2|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|3|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|4|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|5|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|6|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|7|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|8|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|9|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|10|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|11|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|12|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|13|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|14|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|15|0|1|1|1|USPS Tracking|5.32|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box A|16|0|1|1|1|USPS Tracking|0.00|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|1|0|1|1|1|Signature Required|8.61|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|1|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|2|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|3|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|4|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|5|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|6|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|7|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|8|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|9|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|10|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|11|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|12|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|13|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|14|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|15|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|16|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|17|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|18|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|19|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|20|0|1|1|1|USPS Tracking|6.16|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box B|21|0|1|1|1|USPS Tracking|0.00|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|1|0|1|1|1|Signature Required|12.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|1|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|2|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|3|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|4|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|5|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|6|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|7|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|8|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|9|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|10|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|11|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|12|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|13|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|14|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|15|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|16|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|17|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|18|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|19|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|20|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|21|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|22|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|23|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|24|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|25|0|1|1|1|USPS Tracking|9.85|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Regional Rate Box C|26|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|1|0|1|1|1|Signature Required|7.50|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|1|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|2|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|3|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|4|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|5|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|6|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|7|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|8|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|9|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|10|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|11|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|12|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|13|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|14|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|15|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|16|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|17|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|18|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|19|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|20|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|21|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|22|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|23|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|24|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|25|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|26|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|27|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|28|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|29|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|30|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|31|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|32|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|33|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|34|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|35|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|36|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|37|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|38|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|39|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|40|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|41|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|42|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|43|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|44|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|45|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|46|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|47|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|48|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|49|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|50|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|51|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|52|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|53|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|54|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|55|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|56|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|57|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|58|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|59|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|60|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|61|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|62|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|63|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|64|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|65|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|66|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|67|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|68|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|69|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|70|0|1|1|1|USPS Tracking|5.05|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Flat Rate Envelope|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|1|0|1|1|1|Signature Required|8.15|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|1|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|2|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|3|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|4|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|5|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|6|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|7|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|8|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|9|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|10|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|11|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|12|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|13|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|14|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|15|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|16|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|17|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|18|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|19|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|20|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|21|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|22|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|23|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|24|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|25|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|26|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|27|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|28|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|29|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|30|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|31|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|32|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|33|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|34|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|35|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|36|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|37|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|38|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|39|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|40|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|41|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|42|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|43|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|44|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|45|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|46|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|47|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|48|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|49|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|50|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|51|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|52|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|53|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|54|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|55|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|56|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|57|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|58|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|59|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|60|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|61|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|62|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|63|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|64|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|65|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|66|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|67|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|68|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|69|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|70|0|1|1|1|USPS Tracking|5.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Padded Flat Rate Envelope|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|1|0|1|1|1|Signature Required|7.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|1|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|2|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|3|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|4|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|5|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|6|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|7|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|8|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|9|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|10|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|11|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|12|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|13|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|14|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|15|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|16|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|17|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|18|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|19|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|20|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|21|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|22|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|23|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|24|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|25|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|26|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|27|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|28|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|29|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|30|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|31|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|32|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|33|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|34|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|35|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|36|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|37|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|38|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|39|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|40|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|41|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|42|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|43|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|44|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|45|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|46|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|47|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|48|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|49|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|50|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|51|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|52|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|53|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|54|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|55|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|56|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|57|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|58|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|59|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|60|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|61|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|62|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|63|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|64|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|65|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|66|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|67|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|68|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|69|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|70|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Legal Flat Rate Envelope|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|1|0|1|1|1|Signature Required|7.70|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|1|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|2|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|3|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|4|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|5|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|6|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|7|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|8|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|9|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|10|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|11|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|12|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|13|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|14|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|15|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|16|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|17|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|18|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|19|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|20|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|21|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|22|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|23|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|24|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|25|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|26|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|27|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|28|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|29|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|30|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|31|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|32|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|33|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|34|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|35|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|36|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|37|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|38|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|39|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|40|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|41|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|42|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|43|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|44|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|45|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|46|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|47|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|48|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|49|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|50|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|51|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|52|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|53|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|54|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|55|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|56|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|57|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|58|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|59|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|60|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|61|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|62|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|63|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|64|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|65|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|66|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|67|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|68|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|69|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|70|0|1|1|1|USPS Tracking|5.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Small Flat Rate Box|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|1|0|1|1|1|Signature Required|13.75|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|1|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|2|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|3|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|4|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|5|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|6|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|7|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|8|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|9|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|10|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|11|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|12|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|13|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|14|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|15|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|16|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|17|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|18|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|19|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|20|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|21|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|22|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|23|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|24|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|25|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|26|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|27|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|28|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|29|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|30|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|31|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|32|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|33|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|34|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|35|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|36|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|37|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|38|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|39|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|40|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|41|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|42|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|43|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|44|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|45|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|46|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|47|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|48|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|49|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|50|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|51|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|52|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|53|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|54|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|55|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|56|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|57|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|58|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|59|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|60|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|61|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|62|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|63|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|64|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|65|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|66|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|67|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|68|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|69|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|70|0|1|1|1|USPS Tracking|11.30|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Medium Flat Rate Box|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|1|0|1|1|1|Signature Required|18.25|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|1|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|2|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|3|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|4|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|5|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|6|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|7|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|8|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|9|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|10|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|11|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|12|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|13|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|14|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|15|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|16|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|17|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|18|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|19|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|20|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|21|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|22|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|23|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|24|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|25|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|26|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|27|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|28|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|29|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|30|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|31|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|32|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|33|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|34|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|35|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|36|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|37|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|38|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|39|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|40|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|41|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|42|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|43|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|44|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|45|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|46|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|47|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|48|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|49|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|50|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|51|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|52|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|53|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|54|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|55|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|56|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|57|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|58|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|59|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|60|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|61|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|62|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|63|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|64|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|65|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|66|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|67|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|68|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|69|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|70|0|1|1|1|USPS Tracking|15.80|
      |default|Zone1 Test, Priority Mail, 1339 W Willow St Ste B, Long Beach CA 90810|Priority Mail Large Flat Rate Box|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|1|0|1|1|1|Signature Required|15.13|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|0|8|1|1|1|USPS Tracking|13.09|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|1|0|1|1|1|USPS Tracking|15.13|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|2|0|1|1|1|USPS Tracking|15.58|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|3|0|1|1|1|USPS Tracking|15.94|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|4|0|1|1|1|USPS Tracking|16.30|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|5|0|1|1|1|USPS Tracking|16.65|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|6|0|1|1|1|USPS Tracking|16.93|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|7|0|1|1|1|USPS Tracking|17.51|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|8|0|1|1|1|USPS Tracking|18.43|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|9|0|1|1|1|USPS Tracking|19.34|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|10|0|1|1|1|USPS Tracking|20.26|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|11|0|1|1|1|USPS Tracking|21.17|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|12|0|1|1|1|USPS Tracking|22.09|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|13|0|1|1|1|USPS Tracking|23.00|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|14|0|1|1|1|USPS Tracking|23.92|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|15|0|1|1|1|USPS Tracking|24.83|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|16|0|1|1|1|USPS Tracking|25.75|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|17|0|1|1|1|USPS Tracking|26.66|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|18|0|1|1|1|USPS Tracking|27.58|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|19|0|1|1|1|USPS Tracking|28.49|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|20|0|1|1|1|USPS Tracking|29.41|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|21|0|1|1|1|USPS Tracking|30.33|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|22|0|1|1|1|USPS Tracking|31.24|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|23|0|1|1|1|USPS Tracking|32.16|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|24|0|1|1|1|USPS Tracking|33.07|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|25|0|1|1|1|USPS Tracking|33.99|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|26|0|1|1|1|USPS Tracking|34.90|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|27|0|1|1|1|USPS Tracking|35.82|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|28|0|1|1|1|USPS Tracking|36.73|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|29|0|1|1|1|USPS Tracking|37.65|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|30|0|1|1|1|USPS Tracking|38.56|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|31|0|1|1|1|USPS Tracking|39.48|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|32|0|1|1|1|USPS Tracking|40.39|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|33|0|1|1|1|USPS Tracking|41.31|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|34|0|1|1|1|USPS Tracking|42.23|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|35|0|1|1|1|USPS Tracking|43.14|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|36|0|1|1|1|USPS Tracking|44.06|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|37|0|1|1|1|USPS Tracking|44.97|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|38|0|1|1|1|USPS Tracking|45.89|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|39|0|1|1|1|USPS Tracking|46.80|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|40|0|1|1|1|USPS Tracking|47.72|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|41|0|1|1|1|USPS Tracking|48.63|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|42|0|1|1|1|USPS Tracking|49.55|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|43|0|1|1|1|USPS Tracking|50.46|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|44|0|1|1|1|USPS Tracking|51.38|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|45|0|1|1|1|USPS Tracking|52.30|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|46|0|1|1|1|USPS Tracking|53.21|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|47|0|1|1|1|USPS Tracking|54.13|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|48|0|1|1|1|USPS Tracking|55.04|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|49|0|1|1|1|USPS Tracking|55.96|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|50|0|1|1|1|USPS Tracking|56.87|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|51|0|1|1|1|USPS Tracking|57.79|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|52|0|1|1|1|USPS Tracking|58.70|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|53|0|1|1|1|USPS Tracking|59.62|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|54|0|1|1|1|USPS Tracking|60.53|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|55|0|1|1|1|USPS Tracking|61.45|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|56|0|1|1|1|USPS Tracking|62.36|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|57|0|1|1|1|USPS Tracking|63.28|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|58|0|1|1|1|USPS Tracking|64.20|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|59|0|1|1|1|USPS Tracking|65.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|60|0|1|1|1|USPS Tracking|66.03|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|61|0|1|1|1|USPS Tracking|66.94|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|62|0|1|1|1|USPS Tracking|67.86|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|63|0|1|1|1|USPS Tracking|68.77|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|64|0|1|1|1|USPS Tracking|69.69|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|65|0|1|1|1|USPS Tracking|70.60|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|66|0|1|1|1|USPS Tracking|71.52|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|67|0|1|1|1|USPS Tracking|72.43|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|68|0|1|1|1|USPS Tracking|73.35|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|69|0|1|1|1|USPS Tracking|74.26|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|70|0|1|1|1|USPS Tracking|75.18|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Package|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|1|0|1|1|1|Signature Required|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|1|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|2|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|3|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|4|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|5|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|6|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|7|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|8|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|9|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|10|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|11|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|12|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|13|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|14|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|15|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|16|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|17|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|18|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|19|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|20|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|21|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|22|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|23|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|24|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|25|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|26|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|27|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|28|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|29|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|30|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|31|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|32|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|33|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|34|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|35|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|36|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|37|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|38|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|39|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|40|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|41|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|42|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|43|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|44|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|45|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|46|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|47|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|48|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|49|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|50|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|51|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|52|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|53|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|54|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|55|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|56|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|57|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|58|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|59|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|60|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|61|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|62|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|63|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|64|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|65|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|66|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|67|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|68|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|69|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|70|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Flat Rate Envelope|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|1|0|1|1|1|Signature Required|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|1|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|2|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|3|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|4|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|5|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|6|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|7|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|8|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|9|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|10|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|11|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|12|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|13|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|14|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|15|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|16|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|17|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|18|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|19|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|20|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|21|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|22|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|23|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|24|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|25|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|26|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|27|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|28|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|29|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|30|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|31|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|32|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|33|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|34|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|35|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|36|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|37|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|38|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|39|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|40|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|41|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|42|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|43|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|44|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|45|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|46|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|47|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|48|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|49|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|50|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|51|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|52|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|53|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|54|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|55|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|56|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|57|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|58|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|59|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|60|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|61|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|62|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|63|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|64|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|65|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|66|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|67|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|68|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|69|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|70|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Padded Flat Rate Envelope|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|1|0|1|1|1|Signature Required|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|1|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|2|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|3|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|4|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|5|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|6|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|7|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|8|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|9|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|10|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|11|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|12|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|13|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|14|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|15|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|16|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|17|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|18|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|19|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|20|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|21|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|22|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|23|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|24|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|25|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|26|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|27|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|28|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|29|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|30|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|31|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|32|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|33|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|34|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|35|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|36|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|37|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|38|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|39|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|40|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|41|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|42|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|43|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|44|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|45|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|46|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|47|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|48|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|49|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|50|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|51|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|52|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|53|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|54|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|55|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|56|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|57|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|58|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|59|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|60|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|61|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|62|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|63|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|64|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|65|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|66|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|67|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|68|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|69|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|70|0|1|1|1|USPS Tracking|18.11|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Legal Flat Rate Envelope|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|1|0|1|1|1|Signature Required|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|1|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|2|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|3|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|4|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|5|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|6|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|7|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|8|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|9|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|10|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|11|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|12|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|13|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|14|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|15|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|16|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|17|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|18|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|19|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|20|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|21|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|22|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|23|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|24|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|25|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|26|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|27|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|28|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|29|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|30|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|31|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|32|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|33|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|34|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|35|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|36|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|37|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|38|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|39|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|40|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|41|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|42|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|43|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|44|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|45|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|46|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|47|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|48|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|49|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|50|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|51|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|52|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|53|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|54|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|55|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|56|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|57|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|58|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|59|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|60|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|61|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|62|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|63|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|64|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|65|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|66|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|67|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|68|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|69|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|70|0|1|1|1|USPS Tracking|44.95|
      |default|Zone1 Test, Priority Mail Express, 1339 W Willow St, Long Beach CA 90810|Priority Mail Express Medium Flat Rate Box|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|1|0|1|1|1|Signature Required|5.17|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|1|0|1|1|1|USPS Tracking|2.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|2|0|1|1|1|USPS Tracking|3.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|3|0|1|1|1|USPS Tracking|3.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|4|0|1|1|1|USPS Tracking|4.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|5|0|1|1|1|USPS Tracking|4.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|6|0|1|1|1|USPS Tracking|5.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|7|0|1|1|1|USPS Tracking|5.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|8|0|1|1|1|USPS Tracking|6.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|9|0|1|1|1|USPS Tracking|6.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|10|0|1|1|1|USPS Tracking|7.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|11|0|1|1|1|USPS Tracking|7.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|12|0|1|1|1|USPS Tracking|8.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|13|0|1|1|1|USPS Tracking|8.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|14|0|1|1|1|USPS Tracking|9.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|15|0|1|1|1|USPS Tracking|9.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|16|0|1|1|1|USPS Tracking|10.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|17|0|1|1|1|USPS Tracking|10.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|18|0|1|1|1|USPS Tracking|11.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|19|0|1|1|1|USPS Tracking|11.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|20|0|1|1|1|USPS Tracking|12.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|21|0|1|1|1|USPS Tracking|12.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|22|0|1|1|1|USPS Tracking|13.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|23|0|1|1|1|USPS Tracking|13.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|24|0|1|1|1|USPS Tracking|14.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|25|0|1|1|1|USPS Tracking|14.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|26|0|1|1|1|USPS Tracking|15.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|27|0|1|1|1|USPS Tracking|15.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|28|0|1|1|1|USPS Tracking|16.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|29|0|1|1|1|USPS Tracking|16.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|30|0|1|1|1|USPS Tracking|17.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|31|0|1|1|1|USPS Tracking|17.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|32|0|1|1|1|USPS Tracking|18.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|33|0|1|1|1|USPS Tracking|18.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|34|0|1|1|1|USPS Tracking|19.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|35|0|1|1|1|USPS Tracking|19.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|36|0|1|1|1|USPS Tracking|20.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|37|0|1|1|1|USPS Tracking|20.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|38|0|1|1|1|USPS Tracking|21.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|39|0|1|1|1|USPS Tracking|21.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|40|0|1|1|1|USPS Tracking|22.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|41|0|1|1|1|USPS Tracking|22.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|42|0|1|1|1|USPS Tracking|23.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|43|0|1|1|1|USPS Tracking|23.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|44|0|1|1|1|USPS Tracking|24.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|45|0|1|1|1|USPS Tracking|24.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|46|0|1|1|1|USPS Tracking|25.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|47|0|1|1|1|USPS Tracking|25.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|48|0|1|1|1|USPS Tracking|26.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|49|0|1|1|1|USPS Tracking|26.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|50|0|1|1|1|USPS Tracking|27.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|51|0|1|1|1|USPS Tracking|27.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|52|0|1|1|1|USPS Tracking|28.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|53|0|1|1|1|USPS Tracking|28.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|54|0|1|1|1|USPS Tracking|29.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|55|0|1|1|1|USPS Tracking|29.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|56|0|1|1|1|USPS Tracking|30.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|57|0|1|1|1|USPS Tracking|30.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|58|0|1|1|1|USPS Tracking|31.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|59|0|1|1|1|USPS Tracking|31.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|60|0|1|1|1|USPS Tracking|32.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|61|0|1|1|1|USPS Tracking|32.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|62|0|1|1|1|USPS Tracking|33.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|63|0|1|1|1|USPS Tracking|33.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|64|0|1|1|1|USPS Tracking|34.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|65|0|1|1|1|USPS Tracking|34.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|66|0|1|1|1|USPS Tracking|35.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|67|0|1|1|1|USPS Tracking|35.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|68|0|1|1|1|USPS Tracking|36.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|69|0|1|1|1|USPS Tracking|36.72|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|70|0|1|1|1|USPS Tracking|37.22|
      |default|Zone1 Test, Media Mail, 1339 W Willow St, Long Beach CA 90810|Media Mail Package|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|1|0|1|1|1|Signature Required|34.02|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|1|0|1|1|1|USPS Tracking|31.57|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|2|0|1|1|1|USPS Tracking|26.85|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|3|0|1|1|1|USPS Tracking|15.50|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|4|0|1|1|1|USPS Tracking|36.35|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|5|0|1|1|1|USPS Tracking|9.84|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|6|0|1|1|1|USPS Tracking|7.50|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|7|0|1|1|1|USPS Tracking|14.37|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|8|0|1|1|1|USPS Tracking|19.83|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|9|0|1|1|1|USPS Tracking|37.80|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|10|0|1|1|1|USPS Tracking|7.73|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|11|0|1|1|1|USPS Tracking|19.06|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|12|0|1|1|1|USPS Tracking|25.39|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|13|0|1|1|1|USPS Tracking|40.45|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|14|0|1|1|1|USPS Tracking|33.27|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|15|0|1|1|1|USPS Tracking|31.57|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|16|0|1|1|1|USPS Tracking|33.27|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|17|0|1|1|1|USPS Tracking|19.25|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|18|0|1|1|1|USPS Tracking|38.93|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|19|0|1|1|1|USPS Tracking|21.37|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|20|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|21|0|1|1|1|USPS Tracking|25.39|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|22|0|1|1|1|USPS Tracking|26.45|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|23|0|1|1|1|USPS Tracking|26.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|24|0|1|1|1|USPS Tracking|12.95|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|25|0|1|1|1|USPS Tracking|33.73|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|26|0|1|1|1|USPS Tracking|27.91|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|27|0|1|1|1|USPS Tracking|36.75|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|28|0|1|1|1|USPS Tracking|40.85|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|29|0|1|1|1|USPS Tracking|34.30|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|30|0|1|1|1|USPS Tracking|16.74|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|31|0|1|1|1|USPS Tracking|29.77|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|32|0|1|1|1|USPS Tracking|9.55|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|33|0|1|1|1|USPS Tracking|28.53|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|34|0|1|1|1|USPS Tracking|16.25|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|35|0|1|1|1|USPS Tracking|11.74|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|36|0|1|1|1|USPS Tracking|28.55|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|37|0|1|1|1|USPS Tracking|35.35|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|38|0|1|1|1|USPS Tracking|39.96|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|39|0|1|1|1|USPS Tracking|23.23|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|40|0|1|1|1|USPS Tracking|31.31|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|41|0|1|1|1|USPS Tracking|31.10|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|42|0|1|1|1|USPS Tracking|36.41|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|43|0|1|1|1|USPS Tracking|11.23|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|44|0|1|1|1|USPS Tracking|9.84|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|45|0|1|1|1|USPS Tracking|20.81|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|46|0|1|1|1|USPS Tracking|16.43|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|47|0|1|1|1|USPS Tracking|39.96|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|48|0|1|1|1|USPS Tracking|19.31|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|49|0|1|1|1|USPS Tracking|38.57|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|50|0|1|1|1|USPS Tracking|32.03|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|51|0|1|1|1|USPS Tracking|29.41|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|52|0|1|1|1|USPS Tracking|30.28|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|53|0|1|1|1|USPS Tracking|12.46|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|54|0|1|1|1|USPS Tracking|23.90|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|55|0|1|1|1|USPS Tracking|13.75|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|56|0|1|1|1|USPS Tracking|30.64|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|57|0|1|1|1|USPS Tracking|35.28|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|58|0|1|1|1|USPS Tracking|6.64|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|59|0|1|1|1|USPS Tracking|17.00|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|60|0|1|1|1|USPS Tracking|17.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|61|0|1|1|1|USPS Tracking|23.20|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|62|0|1|1|1|USPS Tracking|31.40|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|63|0|1|1|1|USPS Tracking|37.45|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|64|0|1|1|1|USPS Tracking|37.44|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|65|0|1|1|1|USPS Tracking|31.80|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|66|0|1|1|1|USPS Tracking|28.25|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|67|0|1|1|1|USPS Tracking|10.45|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|68|0|1|1|1|USPS Tracking|35.84|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|69|0|1|1|1|USPS Tracking|20.14|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|70|0|1|1|1|USPS Tracking|10.90|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Package|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|1|0|1|1|1|Signature Required|12.60|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|1|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|2|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|3|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|4|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|5|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|6|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|7|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|8|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|9|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|10|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|11|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|12|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|13|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|14|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|15|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|16|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|17|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|18|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|19|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|20|0|1|1|1|USPS Tracking|10.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|21|0|1|1|1|USPS Tracking|25.39|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|22|0|1|1|1|USPS Tracking|26.45|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|23|0|1|1|1|USPS Tracking|26.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|24|0|1|1|1|USPS Tracking|12.95|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|25|0|1|1|1|USPS Tracking|33.73|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|26|0|1|1|1|USPS Tracking|27.91|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|27|0|1|1|1|USPS Tracking|36.75|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|28|0|1|1|1|USPS Tracking|40.85|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|29|0|1|1|1|USPS Tracking|34.30|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|30|0|1|1|1|USPS Tracking|16.74|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|31|0|1|1|1|USPS Tracking|29.77|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|32|0|1|1|1|USPS Tracking|9.55|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|33|0|1|1|1|USPS Tracking|28.53|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|34|0|1|1|1|USPS Tracking|16.25|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|35|0|1|1|1|USPS Tracking|11.74|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|36|0|1|1|1|USPS Tracking|28.55|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|37|0|1|1|1|USPS Tracking|35.35|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|38|0|1|1|1|USPS Tracking|39.96|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|39|0|1|1|1|USPS Tracking|23.23|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|40|0|1|1|1|USPS Tracking|31.31|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|41|0|1|1|1|USPS Tracking|31.10|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|42|0|1|1|1|USPS Tracking|36.41|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|43|0|1|1|1|USPS Tracking|11.23|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|44|0|1|1|1|USPS Tracking|9.84|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|45|0|1|1|1|USPS Tracking|20.81|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|46|0|1|1|1|USPS Tracking|16.43|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|47|0|1|1|1|USPS Tracking|39.96|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|48|0|1|1|1|USPS Tracking|19.31|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|49|0|1|1|1|USPS Tracking|38.57|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|50|0|1|1|1|USPS Tracking|32.03|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|51|0|1|1|1|USPS Tracking|29.41|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|52|0|1|1|1|USPS Tracking|30.28|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|53|0|1|1|1|USPS Tracking|12.46|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|54|0|1|1|1|USPS Tracking|23.90|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|55|0|1|1|1|USPS Tracking|13.75|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|56|0|1|1|1|USPS Tracking|30.64|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|57|0|1|1|1|USPS Tracking|35.28|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|58|0|1|1|1|USPS Tracking|6.64|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|59|0|1|1|1|USPS Tracking|17.00|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|60|0|1|1|1|USPS Tracking|17.15|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|61|0|1|1|1|USPS Tracking|23.20|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|62|0|1|1|1|USPS Tracking|31.40|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|63|0|1|1|1|USPS Tracking|37.45|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|64|0|1|1|1|USPS Tracking|37.44|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|65|0|1|1|1|USPS Tracking|31.80|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|66|0|1|1|1|USPS Tracking|28.25|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|67|0|1|1|1|USPS Tracking|10.45|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|68|0|1|1|1|USPS Tracking|35.84|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|69|0|1|1|1|USPS Tracking|20.14|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|70|0|1|1|1|USPS Tracking|10.90|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Large Package|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|1|0|1|1|1|Signature Required|65.44|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|1|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|2|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|3|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|4|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|5|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|6|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|7|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|8|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|9|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|10|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|11|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|12|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|13|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|14|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|15|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|16|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|17|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|18|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|19|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|20|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|21|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|22|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|23|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|24|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|25|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|26|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|27|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|28|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|29|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|30|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|31|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|32|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|33|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|34|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|35|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|36|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|37|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|38|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|39|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|40|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|41|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|42|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|43|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|44|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|45|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|46|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|47|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|48|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|49|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|50|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|51|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|52|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|53|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|54|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|55|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|56|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|57|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|58|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|59|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|60|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|61|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|62|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|63|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|64|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|65|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|66|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|67|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|68|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|69|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|70|0|1|1|1|USPS Tracking|62.99|
      |default|Zone1 Test, Parcel Select, 1339 W Willow St, Long Beach CA 90810|Parcel Select Oversized Package|71|0|1|1|1|USPS Tracking|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|1|1|1|1|None|0.98|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|2|1|1|1|None|1.20|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|3|1|1|1|None|1.42|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|4|1|1|1|None|1.64|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|5|1|1|1|None|1.86|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|6|1|1|1|None|2.08|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|7|1|1|1|None|2.30|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|8|1|1|1|None|2.52|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|9|1|1|1|None|2.74|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|10|1|1|1|None|2.96|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|11|1|1|1|None|3.18|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|12|1|1|1|None|3.40|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|13|1|1|1|None|3.62|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Large Envelope/Flat|0|14|1|1|1|None|0.00|

  @local_rating_zone1 @local_rating
  Scenario:
    Then I Add a new order
    Then Verify Local Rating
      |ship_from|ship_to|service|weight_lbs|weight_oz|length|height|width|tracking|total|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|1|1|1|1|Signature Required|100020.45|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|1|1|1|1|USPS Tracking|100018.00|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|2|1|1|1|USPS Tracking|100018.00|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|3|1|1|1|USPS Tracking|100018.00|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|4|1|1|1|USPS Tracking|3.44|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|5|1|1|1|USPS Tracking|4.05|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|6|1|1|1|USPS Tracking|100018.00|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|7|1|1|1|USPS Tracking|100018.00|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|8|1|1|1|USPS Tracking|100018.00|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|9|1|1|1|USPS Tracking|100018.00|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|10|1|1|1|USPS Tracking|4.05|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|11|1|1|1|USPS Tracking|2.04|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|12|1|1|1|USPS Tracking|100018.00|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|13|1|1|1|USPS Tracking|2.04|
      |default|Zone1 Test, First-Class Mail, 1339 W Willow St, Long Beach CA 90810|First-Class Mail Package/Thick Envelope|0|14|1|1|1|USPS Tracking|0.00|


