@print_costs
Feature:
  As a batch shipper, I want to print shipping costs

  Background:
    Given I am signed in as a batch shipper auto20/password1

  Scenario Outline: Print Costs
    * Add new order
    * Expect new Order ID created
    * Expect Service Cost to be $0.00
    * Expect Insurance Cost to be $0.00
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $0.00
    * Expect Tracking to be None
    * Set Ship From to default
    * Set Recipient Complete Address to B-01631, B-01631 , 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Insured Value to $10.00
    * Set Service to First-Class Mail Large Envelope/Flat
    * Expect Tracking to be None
    * Expect Service Cost to be $0.98
    * Expect Insured Value to be $10.00
    * Expect Insurance Cost to be $2.20
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $3.18
    * Expect Ship Cost to be $3.18
    * Expect Print Window Total Cost to be $3.18
    * Sign out

    Examples:
      | service                                   | pounds | ounces | length | width | height | default_tracking | tracking   | service_rate_expectation| insure_for  | insurance_cost | tracking_cost  | total_cost | complete_address                                                   | phone         | email             |
      | First-Class Mail Large Envelope/Flat      |        | 1      |        |       |        | None             |            |                         |             |                | 0.00           |      | B-01631, B-01631 , 1900 E Grand Ave, El Segundo, CA, 90245 |               | rtest@stamps.com  |
      | Priority Mail Package                     | 1      | 1      |        |       |        | USPS Tracking    |            |                         |             |                | 0.00           |        | B-01736, B-01631, 1900 E Grand Ave, El Segundo, CA, 90245 |               | rtest@stamps.com  |
      | Priority Mail Express Flat Rate Envelope  |        | 1      | 1      | 1     | 1      | USPS Tracking    |            |                         |             |                | 0.00           |       | B-01743, B-01743, 1900 E Grand Ave, El Segundo, CA, 90245 |               | rtest@stamps.com  |
