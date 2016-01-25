
Feature: Ship-To Addresses

  Background:
    Given I am signed in to Orders

  @inline_service_rates
  Scenario:  System Calls GetRates When "Ship-To Address" is changed
    Then Add New Order
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Expect Order Details Service Cost inline price for "Priority Mail Large/Thick Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Large Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Padded Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Legal Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Small Flat Rate Box" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Medium Flat Rate Box" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Large Flat Rate Box" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Regional Rate Box A" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Regional Rate Box B" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Express Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Express Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Express Legal Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Priority Mail Express Padded Flat Rate Envelope" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Parcel Select Ground Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Parcel Select Ground Large Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Parcel Select Ground Oversized Package" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "Media Mail Package" to be greater than $0.01
    Then Expect Grid Pounds to be 0
    Then Expect Grid Ounces to be 0
    Then Expect Grid Weight to be 0 lbs. 0 oz.
    And Sign out


