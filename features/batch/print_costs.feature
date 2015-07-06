@printing_costs
Feature:
  B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print

  Background:
    Given I am signed in as a batch shipper auto20/password1

  Scenario Outline:  Print - Priority Mail Package
    * Add new order
    * Expect new Order ID created
    * Expect Service Rate to be $0.00
    * Set Ship From to default
    * Set Recipient Complete Address to B-01631 Total Costs, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to <ounces>
    * Set Service to <service>
    * Expect Service Rate to be \$[0-9.]+
    * Sign out

  Examples:
  | service                                   | ounces  | service_cost_expectation  | insure_for | insured_value_expectation  | insure_for_ tracking_cost | Postage Costs | Stamps.com Insurance Costs | Tracking Costs | Total Cost |
  | Large Envelope/Flat                       | 1       | $0.98                     | $5.50      | $2.20                     | $0.00         | $185.47       | 16.55                      | $4.90          | $206.92    |
  | Priority Mail Large/Thick Envelope        | 1       | $6.51                     | $2.20      |$2.75          | $2.45         | $185.47       | 16.55                      | $4.90          | $206.92    |
  | Priority Mail Express Flat Rate Envelope  | 1       | $18.11                    | $2.20      |$4.60          | $0.00         | $185.47       | 16.55                      | $4.90          | $206.92    |
  | Parcel Select Oversized Package           | 1       | $159.87                   | $2.20      |$7.00          | $2.45         | $185.47       | 16.55                      | $4.90          | $206.92    |
