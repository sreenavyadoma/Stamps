@regression
Feature: B-01671 User Views Price Next to Service Dropdown

  Background:
    Given I am signed in as a batch shipper

  Scenario: User Views Price Next to Service Dropdown
    * Add new order

    * Set Recipient Address to B-01671, Service Inline Rates, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 794-4522
    * Set Email to rtest@stamps.com
    * Set Ounces to 1
    * Set Service to Priority Mail Package
    * Expect Recipient Name to be B-01671
    * Expect Company Name to be Service Inline Rates
    * Expect Street Address to be 1900 E Grand Ave
    * Expect City to be El Segundo
    * Expect State to be CA
    * Expect Zip Code to be 90245
    * Expect Phone to be (415) 794-4522
    * Expect Email to be rtest@stamps.com
    * Expect Pounds to be 0
    * Expect Ounces to be 1
    * Expect Weight to be 0 lbs. 1 oz.

    * Edit row 1 in the order grid
    * Change Ship-To Address to B-01671, Ship To Address is changed, 1901 Avenue Of The Stars, Los Angeles, CA, 90067-6001
    * Expect Service Cost to be greater than $0.00
