@regression
Feature: B-01726 Update Postage Balance After Each Print

  Background:
    Given I am signed in as a batch shipper auto20/password1

  @print_costs
  Scenario: B-01726 Update Postage Balance After Each Print
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Recipient Complete Address to B-01726, Update Postage Balance After Each Print, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Insured Value to $10.00
    * Set Service to First-Class Mail Large Envelope/Flat
    * Print
    * Sign out
