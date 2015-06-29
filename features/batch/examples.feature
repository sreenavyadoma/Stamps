#@regression
Feature: B-01671 As a batch shipper, I want to see in-line rates as I edit an order

  Background:
    Given I am signed in as a batch shipper with credentials auto06/password1

  #@inline_rates
  Scenario:  Inline Rates
    * Add a new order
    * Edit row 1 in the order grid
    #  Setting Single order form values
    * Set Service to First Class Mail Package/Thick Envelope
    * Set Service to First-Class Mail Envelope
    * Set Service to First-Class Mail Large Envelope/Flat
    * Set Service to First-Class Mail Package/Thick Envelope
    * Set Service to Priority Mail Large/Thick Envelope
    * Set Service to Priority Mail Package
    * Set Service to Priority Mail Large Package
    * Set Service to Priority Mail Flat Rate Envelope
    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Service to Priority Mail Small Flat Rate Box
    * Set Service to Priority Mail Medium Flat Rate Box
    * Set Service to Priority Mail Large Flat Rate Box
    * Set Service to Priority Mail Regional Rate Box A
    * Set Service to Priority Mail Regional Rate Box B
    * Set Service to Priority Mail Regional Rate Box C
    * Set Service to Priority Mail Express Package
    * Set Service to Priority Mail Express Flat Rate Envelope
    * Set Service to Priority Mail Express Legal Flat Rate Envelope
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Set Service to Parcel Select Package
    * Set Service to Parcel Select Large Package
    * Set Service to Parcel Select Oversized Package
    * Set Service to Media Mail Package

    * Set Pounds to 1
    * Set Ounces to 1
    * Set Length to 1
    * Set Width to 1
    * Set Height to 1
    * Set Insured Value to 1.09
    
    * Set Ship From to default
    * Set Recipient Complete Address to B-01671, Inline Rates, 1900 E Grand Ave, El Segundo, CA, 90245
    * Set Phone to (415) 123-5555
    * Set Email to rtest@stamps.com
    * Click Ship To Less button

    * Set Receipient address to;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Media Mail Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |

    # Expectations
    * Expect new Order ID created
    * Expect order-grid Recipient Name to be B-01671
    * Expect order-grid Company Name to be Inline Rates
    * Expect order-grid Street Address to be 1900 E Grand Ave
    * Expect order-grid City to be El Segundo
    * Expect order-grid State to be CA
    * Expect Zip to be 90245
    * Expect Phone to be (415) 123-5555
    * Expect Email to be rtest@stamps.com
    * Expect order-grid Pounds to be 0
    * Expect order-grid Ounces to be 1
    * Expect Weight to be 0 lbs. 1 oz.
    * Expect Insured Value to be 15.00
    * Expect Single Order Form - Service Rate to be $0.00
    * Expect Service in-line rate for First-Class Mail Postcard to be greater than $0.35
    * Expect Single Order Form - Service Rate to be $0.35
    * Expect Service in-line rate for First Class Mail Package/Thick Envelope to be greater than $2.04
    * Expect Single Order Form - Service Rate to be $2.04
    * Expect Service in-line rate for First-Class Mail Envelope to be greater than $0.48
    * Expect Single Order Form - Service Rate to be $0.48
    * Expect Service in-line rate for First-Class Mail Large Envelope/Flat to be greater than $0.98
    * Expect Single Order Form - Service Rate to be $0.98
    * Expect Service in-line rate for Priority Mail Large/Thick Envelope to be greater than $5.05
    * Expect Single Order Form - Service Rate to be $5.05
    * Expect Service in-line rate for Priority Mail Package to be greater than $5.05
    * Expect Single Order Form - Service Rate to be $5.05
    * Expect Service in-line rate for Priority Mail Large Package to be greater than $5.54
    * Expect Single Order Form - Service Rate to be $5.54
    * Expect Service in-line rate for Priority Mail Flat Rate Envelope to be greater than $5.05
    * Expect Single Order Form - Service Rate to be $5.05
    * Expect Service in-line rate for Priority Mail Padded Flat Rate Envelope to be greater than $5.70
    * Expect Single Order Form - Service Rate to be $5.70
    * Expect Service in-line rate for Priority Mail Legal Flat Rate Envelope to be greater than $5.25
    * Expect Single Order Form - Service Rate to be $5.25
    * Expect Service in-line rate for Priority Mail Small Flat Rate Box to be greater than $5.25
    * Expect Single Order Form - Service Rate to be $5.25
    * Expect Service in-line rate for Medium Flat Rate Box to be greater than $11.30
    * Expect Single Order Form - Service Rate to be $11.30
    * Expect Service in-line rate for Priority Mail Large Flat Rate Box to be greater than $15.80
    * Expect Single Order Form - Service Rate to be $15.80
    * Expect Service in-line rate for Priority Mail Regional Rate Box A to be greater than $5.32
    * Expect Single Order Form - Service Rate to be $5.32
    * Expect Service in-line rate for Priority Mail Regional Rate Box B to be greater than $6.16
    * Expect Single Order Form - Service Rate to be $6.16
    * Expect Service in-line rate for Priority Mail Regional Rate Box C to be greater than $9.85
    * Expect Single Order Form - Service Rate to be $9.85
    * Expect Service in-line rate for Priority Mail Express Package to be greater than $13.09
    * Expect Single Order Form - Service Rate to be $13.09
    * Expect Service in-line rate for Priority Mail Express Flat Rate Envelope to be greater than $18.11
    * Expect Single Order Form - Service Rate to be $18.11
    * Expect Service in-line rate for Priority Mail Express Legal Flat Rate Envelope to be greater than $18.11
    * Expect Single Order Form - Service Rate to be $18.11
    * Expect Service in-line rate for Priority Mail Express Medium Flat Rate Box to be greater than $44.95
    * Expect Single Order Form - Service Rate to be $44.95
    * Expect Service in-line rate for Parcel Select Package to be greater than $5.70
    * Expect Single Order Form - Service Rate to be $5.70
    * Expect Service in-line rate for Parcel Select Large Package to be greater than $17.75
    * Expect Single Order Form - Service Rate to be $17.75
    * Expect Service in-line rate for Parcel Select Oversized Package to be greater than $62.99
    * Expect Single Order Form - Service Rate to be $62.99
    * Expect Service in-line rate for Media Mail Package to be greater than $2.72
    * Expect Single Order Form - Service Rate to be $2.72

    * Expect Ounces tooltip to display - The maximum value for this field is 15
    * Expect Pounds tooltip to display - The maximum value for this field is 70

    * Expect Ship-To address to be;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Media Mail Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00             | 0       | 1      | 0       | 0     | 0     |
    * Sign out

