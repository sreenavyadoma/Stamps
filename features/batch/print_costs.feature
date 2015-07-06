@printing_costs
Feature:
  B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print

  Background:
    Given I am signed in as a batch shipper auto20/password1

  Scenario Outline:  Print - Priority Mail Package
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Recipient Complete Address to B-01631 Total Costs, Priority Mail Package, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to <ounces>
    * Set Service to <service>
    * Set Insured Value to <insure_for>
    * Expect Service Rate to be $<service_rate_expectation>
    * Expect Insured Value to be <insure_for>
    * Sign out

    Examples:
      | service             | ounces | service_rate_expectation | insure_for | insured_value_expectation |
      | Large Envelope/Flat | 1      | 0.98                     | 5.50       | 2.20                      |