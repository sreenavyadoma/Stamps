@printing_costs
Feature:
  B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print

  Background:
    Given I am signed in as a batch shipper auto20/password1

  Scenario Outline:  Print - Priority Mail Package
    * Add new order
    * Expect new Order ID created
    * Expect Service Cost to be $0.00
    * Expect Insurance Cost to be $0.00
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $0.00
    * Expect Tracking to be None
    * Set Ship From to default
    * Set Recipient Complete Address to B-01631 Total Costs, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Pounds to <pounds>
    * Set Ounces to <ounces>
    * Set Length to <length>
    * Set Width to <width>
    * Set Height to <height>
    * Set Service to <service>
    * Set Insured Value to <insure_for>
    * Expect Tracking to be <tracking_expectation>
    * Expect Service Cost to be $<service_rate_expectation>
    * Expect Insured Value to be <insure_for>
    * Expect Insurance Cost to be $<insurance_cost>
    * Expect Tracking Cost to be $<tracking_cost>
    * Expect Total to be $<total_cost>
    * Expect Ship Cost to be $<total_cost>
    * Expect Print Window Total Cost to be $<total_cost>
    * Sign out

    Examples:
      | service             | pounds | ounces | length  |width  | height  | tracking_expectation | service_rate_expectation | insure_for | insurance_cost | tracking_cost | total_cost |
      | Large Envelope/Flat | 0      | 1      | 0       | 0     | 0       | None                 | 0.98                     | 1.00       | 2.20           | 0.00          | 3.18       |

