@bvt_exclude
Feature: BVT - Purchasing

  Background:
    Given I am signed in as a batch shipper

  @bvt_purchasing
  Scenario: $10
    * Add new order
    * Set Recipient Address to B-01671, Inline Rates, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Set Pounds to 10
    * Set Service to Priority Mail Large Package
    * Print
    * Buy $10 postage
    * Expect $10 is added to customer balance
    * Sign out