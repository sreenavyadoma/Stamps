@wip
Feature: Service Control

  Background:
    Given I am signed in as a batch shipper auto01/password1

  Scenario:  First-Class Mail - Package Service Test
    * Add new order
    * Expect Service Rate to be $0.00
    * Set Service to First-Class Mail Postcard
    * Set Service to Priority Mail Large/Thick Envelope
    * Set Service to Priority Mail Package
    * Set Service to Priority Mail Large Package
    * Set Service to Priority Mail Flat Rate Envelope
    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Set Service to Priority Mail Small Flat Rate Box
    * Set Service to Medium Flat Rate Box
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
    * Set Ship From to default
    * Set Receipient address to;
      | name  | company    | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Package         | B-01588 Domestic USPS service  | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 12.59      | 5       | 10     | 2       | 4     | 6       |
    * Expect new Order ID created
    * Expect Ship-To address to be;
      | name  | company   | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Package         | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 12.59      | 5       | 10     | 2       | 4     | 6       |
    * Sign out
