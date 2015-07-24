Feature: B-01671 As a batch shipper, I want to see in-line rates as I edit an order

  Background:
    Given I am signed in as a batch shipper

  Scenario:  User Views Price Next to Service Dropdown
    * Add new order
    * Set Recipient Address to B-01671, Inline Rates, 1990 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button

    * Set Pounds to 1
    * Set Ounces to 1
    * Set Length to 1
    * Set Width to 1
    * Set Height to 1
    * Set Insured Value to $1.00

    * Set Service to Priority Mail Package

    * Expect Recipient Name to be B-01671
    * Expect Company Name to be Inline Rates
    * Expect Street Address to be 1990 E Grand Ave
    * Expect City to be El Segundo
    * Expect State to be CA
    * Expect Zip Code to be 90245
    * Expect Phone to be (415) 123-5555
    * Expect Email to be rtest@stamps.com
    * Expect Pounds to be 1
    * Expect Ounces to be 1
    * Expect Weight to be 1 lbs. 1 oz.
    * Expect Insured Value to be $1.00
    * Sign out
