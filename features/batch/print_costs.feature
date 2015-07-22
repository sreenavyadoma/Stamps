@regression
Feature: B-01631 Printing total cost

  Background:
    Given I am signed in as a batch shipper

  @print_costs
  Scenario: B-01631 As a batch shipper, I want to be able to see the total cost of my print job before I print
    * Add new order
    * Expect Service Cost to be $0.00
    * Expect Insurance Cost to be $0.00
    * Expect Tracking Cost to be $0.00
    * Expect Total to be $0.00
    * Expect Tracking to be None

    * Set Recipient Address to B-01631, Total Cost, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Package
    * Expect Tracking to be None
    * Sign out
