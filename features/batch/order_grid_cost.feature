@regression
Feature: B-01743 Show Cost of Order in Ship Cost Grid

  Background:
    Given I am signed in as a batch shipper

  @print_costs
  Scenario: B-01743 Show Cost of Order in Ship Cost Grid
    * Add new order

    * Set Recipient Address to B-01743, Ship Cost, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Email to rtest@stamps.com
    * Click Ship To Less button
    * Set Ounces to 1
    * Set Insured Value to $10.00
    * Set Service to Priority Mail Package
    * Expect Ship Cost to be $3.18
    * Expect Print Window Total Cost to be $3.18
    * Sign out
