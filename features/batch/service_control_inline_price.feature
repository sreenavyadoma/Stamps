@regression
Feature: B-01671 As a batch shipper, I want to see in-line rates as I edit an order

  Background:
    Given I am signed in as a batch shipper with credentials auto09/password1

  @ship_to_address_get_rates
  Scenario: System Calls GetRates When "Ship To Address" is changed
    * Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Recipient Complete Address to B-01671, Inline Rates, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 794-4522
    * Set Email to rtest@stamps.com
    * Set Ounces to 1
    * Set Service to Priority Mail Package
    * Expect order-grid Recipient Name to be B-01671
    * Expect order-grid Company Name to be Inline Rates
    * Expect order-grid Street Address to be 1900 E Grand Ave
    * Expect order-grid City to be El Segundo
    * Expect order-grid State to be CA
    * Expect Zip to be 90245
    * Expect Phone to be (415) 794-4522
    * Expect Email to be rtest@stamps.com
    * Expect order-grid Pounds to be 0
    * Expect order-grid Ounces to be 1
    * Expect Weight to be 0 lbs. 1 oz.

    * Edit row 1 in the order grid
    * Change Ship-To Address to B-01671, Ship To Address is changed, 1901 Avenue Of The Stars, Los Angeles, CA, 90067-6001
    * Expect Single Order Form Service Rate to be greater than $0.00

  @user_views_price_next_to_service_dropdown
  Scenario:  User Views Price Next to Service Dropdown
    * Add a new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Recipient Complete Address to B-01671, Inline Rates, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 794-4522
    * Set Email to rtest@stamps.com
    * Expect Single Order Form - Service Rate to be $0.00
    * Expect Service in-line rate for First-Class Mail Postcard to be greater than $0.01
    * Expect Service in-line rate for First-Class Mail Envelope to be greater than $0.01
    * Expect Service in-line rate for First-Class Mail Large Envelope/Flat to be greater than $0.01
    * Expect Service in-line rate for First-Class Mail Package/Thick Envelope to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Large/Thick Envelope to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Package to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Large Package to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Flat Rate Envelope to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Padded Flat Rate Envelope to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Legal Flat Rate Envelope to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Small Flat Rate Box to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Medium Flat Rate Box to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Large Flat Rate Box to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Regional Rate Box A to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Regional Rate Box B to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Regional Rate Box C to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Express Package to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Express Flat Rate Envelope to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Express Legal Flat Rate Envelope to be greater than $0.01
    * Expect Service in-line rate for Priority Mail Express Medium Flat Rate Box to be greater than $0.01
    * Expect Service in-line rate for Parcel Select Package to be greater than $0.01
    * Expect Service in-line rate for Parcel Select Large Package to be greater than $0.01
    * Expect Service in-line rate for Parcel Select Oversized Package to be greater than $0.01
    * Expect Service in-line rate for Media Mail Package to be greater than $0.01
    * Expect order-grid Recipient Name to be B-01671
    * Expect order-grid Company Name to be Inline Rates
    * Expect order-grid Street Address to be 1900 E Grand Ave
    * Expect order-grid City to be El Segundo
    * Expect order-grid State to be CA
    * Expect Zip to be 90245
    * Expect Phone to be (415) 794-4522
    * Expect Email to be rtest@stamps.com
    * Expect order-grid Pounds to be 0
    * Expect order-grid Ounces to be 0
    * Expect Weight to be 0 lbs. 0 oz.
    * Sign out


