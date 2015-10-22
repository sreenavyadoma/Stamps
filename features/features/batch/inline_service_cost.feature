
Feature: Ship-To Addresses

  Background:
    Given I am signed in as a batch shipper

  @inline_service_rates @regression
  Scenario:  System Calls GetRates When "Ship-To Address" is changed
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Expect single-order form Service Cost inline price for "Priority Mail Large/Thick Envelope" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Package" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Large Package" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Flat Rate Envelope" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Padded Flat Rate Envelope" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Legal Flat Rate Envelope" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Small Flat Rate Box" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Medium Flat Rate Box" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Large Flat Rate Box" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Regional Rate Box A" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Regional Rate Box B" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Regional Rate Box C" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Express Package" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Express Flat Rate Envelope" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Express Legal Flat Rate Envelope" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Priority Mail Express Medium Flat Rate Box" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Parcel Select Package" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Parcel Select Large Package" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Parcel Select Oversized Package" to be greater than $0.01
    Then Expect single-order form Service Cost inline price for "Media Mail Package" to be greater than $0.01
    Then Expect order-grid Pounds to be 0
    Then Expect order-grid Ounces to be 0
    Then Expect order-grid Weight to be 0 lbs. 0 oz.
    And Sign out


