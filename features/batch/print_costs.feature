@printing_costs
Feature:
  B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
  B-01634 As a batch shipper, I want to be able to print postage for multiple selected orders
  B-01726 Update Postage Balance After Each Print
  B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
  B-01736 Set Correct Default for Tracking
  B-01743 Show Cost of Order in Ship Cost Grid

  Background:
    Given I am signed in as a batch shipper auto20/password1

  Scenario Outline:
    * Add new order
    * Expect new Order ID created
    * Expect Service Cost to be $0.00
    * Expect Insurance Cost to be $0.00
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $0.00
    * Expect Tracking to be None
    * Set Ship From to default
    * Set Recipient Complete Address to <complete_address>
    * Set Phone to <phone>
    * Set Email to <email>
    * Click Ship To Less button
    * Set Pounds to <pounds>
    * Set Ounces to <ounces>
    * Set Length to <length>
    * Set Width to <width>
    * Set Height to <height>
    * Set Insured Value to <insure_for>
    * Set Service to <service>
    * Expect Tracking to be <default_tracking>
    * Set Tracking to <tracking>
    * Expect Service Cost to be $<service_rate_expectation>
    * Expect Insured Value to be <insure_for>
    * Expect Insurance Cost to be $<insurance_cost>
    * Expect Tracking Cost to be $<tracking_cost>
    * Expect Total to be $<total_cost>
    * Expect Ship Cost to be $<total_cost>
    * Expect Print Window Total Cost to be $<total_cost>
    * Sign out

    Examples:
      | service             | pounds | ounces | length | width | height | default_tracking | tracking   | service_rate_expectation | insure_for | insurance_cost | tracking_cost  | total_cost | complete_address                                                   | phone         | email             |
      | Large Envelope/Flat |        | 1      |        |       |        | None             |            | 0.98                     | 1.00       |                | 0.00           | 3.18       | B-01631 B-01634 , B-01726, 1900 E Grand Ave, El Segundo, CA, 90245 |               | rtest@stamps.com  |