Feature: Test Development
  Background:
    Given I am signed in as a batch shipper

  Scenario:
    And I Add a new order
    Then Set Order Details Form Ship-To country to Canada
    Then Set Order Details Form Ship-To country to United States

    Then Set Order Details Form Ship-From to default

    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To to ambiguous address
      | name    | company           | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Joseph Balancio | Company Name | 1390 Market Street  | San Francisco | CA    | 94102 | United States | (415) 123-5555  | rtest@stamps.com  |
    Then Expect "Exact Address Not Found" module to appear
    And Select row 2 from Exact Address Not Found module
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Expect Grid Recipient to be Joseph Balancio
    Then Expect Grid Company to be Company Name
    Then Expect Grid City to be San Francisco
    Then Expect Grid State to be CA
    Then Expect Grid Zip to be 94102

    Then Set Order Details Form Ship-To address to random

    Then Set Order Details Form Ship-To address to
      | name          | company       | street_address      | city          | state | zip   | country       | phone           |  email            |
      | Euan Davidson | Company Name  | 1350 Market Street  | San Francisco | CA    |       | United States | (415) 123-5555  | rtest@stamps.com  |
    And I Add a new order
    Then Set Ship-To to international address
      | name   | company | street_address_1         | street_address_2 | city   | province | postal_code  | country| phone   |  email  |
      | random | random  | 234 Laurier Avenue West  | random           | Ottawa | Ontario  | K1A 0G9      | Canada | random  | random  |
    And I Add a new order
    Then Set Order Details Form Ship-To address to random
    And I Add a new order
    Then Set Order Details Form Ship-To address to San
    And I Add a new order
    Then Set Order Details Form Ship-To address to San

  Scenario:
    And I Add a new order
    Then Set Order Details Form Ship-From to default
    Then Set Order Details Form Ship-To address to random
    Then Set Order Details Form Service to "Priority Mail Package"
    Then Expect Order Details Form Service to be "Priority Mail Package"
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Package" to be greater than $0.01
    Then Expect Order Details Form Service Tooltip for "Priority Mail Package" to include "Priority Mail Package,Ship up to 70 lbs. using any box with pricing that varies by weight and distance,The USPS provides free packaging for Priority Mail which can be ordered from Stamps.com."

    Then Set Order Details Form Tracking to "USPS Tracking"
    Then Expect Order Details Form Tracking to be "USPS Tracking"
    Then Set Order Details Form Tracking to "Signature Required"
    Then Expect Order Details Form Tracking to be "Signature Required"

    Then Set Order Details Form Service to "Priority Mail Package"
    Then Expect Order Details Form Service to be "Priority Mail Package"
    Then Expect Order Details Form Tracking to be "Signature Required"

    Then Set Order Details Form Service to "Priority Mail Package"
    Then Expect Order Details Form Service to be "Priority Mail Package"
    Then Set Order Details Form Service to "Priority Mail Large Package"
    Then Expect Order Details Form Service to be "Priority Mail Large Package"

    Then Expect Order Details Form Service Cost inline price for "Priority Mail Large/Thick Envelope" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Package" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Large Package" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Padded Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Legal Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Small Flat Rate Box" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Medium Flat Rate Box" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Large Flat Rate Box" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Regional Rate Box A" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Regional Rate Box B" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Regional Rate Box C" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Express Package" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Express Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Express Legal Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Priority Mail Express Medium Flat Rate Box" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Parcel Select Package" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Parcel Select Large Package" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Parcel Select Oversized Package" to be greater than $0.01
    Then Expect Order Details Form Service Cost inline price for "Media Mail Package" to be greater than $0.01

    Then Expect Grid Pounds to be 0
    Then Expect Grid Ounces to be 0
    Then Expect Grid Weight to be 0 lbs. 0 oz.
