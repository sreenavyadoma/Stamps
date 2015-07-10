@regression
Feature: B-01671 As a batch shipper, I want to see in-line rates as I edit an order

  Background:
    Given I am signed in as a batch shipper

  @inline_service_rates
  Scenario: System Calls GetRates When "Ship To Address" is changed
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Recipient Complete Address to B-01671, Inline Rates, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 794-4522
    * Set Email to rtest@stamps.com
    * Set Ounces to 1
    * Set Service to Priority Mail Package
    * Expect Recipient Name to be B-01671
    * Expect Company Name to be Inline Rates
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

  Scenario:  User Views Price Next to Service Dropdown
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Recipient Complete Address to B-01671, Inline Rates, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 794-4522
    * Set Email to rtest@stamps.com
    * Expect Service Cost to be $0.00
    * Expect inline Service Cost for First-Class Mail Large Envelope/Flat to be greater than $0.01
    * Expect inline Service Cost for First-Class Mail Package/Thick Envelope to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Large/Thick Envelope to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Package to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Large Package to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Flat Rate Envelope to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Padded Flat Rate Envelope to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Legal Flat Rate Envelope to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Small Flat Rate Box to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Medium Flat Rate Box to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Large Flat Rate Box to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Regional Rate Box A to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Regional Rate Box B to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Regional Rate Box C to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Express Package to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Express Flat Rate Envelope to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Express Legal Flat Rate Envelope to be greater than $0.01
    * Expect inline Service Cost for Priority Mail Express Medium Flat Rate Box to be greater than $0.01
    * Expect inline Service Cost for Parcel Select Package to be greater than $0.01
    * Expect inline Service Cost for Parcel Select Large Package to be greater than $0.01
    * Expect inline Service Cost for Parcel Select Oversized Package to be greater than $0.01
    * Expect inline Service Cost for Media Mail Package to be greater than $0.01
    * Expect Recipient Name to be B-01671
    * Expect Company Name to be Inline Rates
    * Expect Street Address to be 1900 E Grand Ave
    * Expect City to be El Segundo
    * Expect State to be CA
    * Expect Zip Code to be 90245
    * Expect Phone to be (415) 794-4522
    * Expect Email to be rtest@stamps.com
    * Expect Pounds to be 0
    * Expect Ounces to be 0
    * Expect Weight to be 0 lbs. 0 oz.
    * Sign out


