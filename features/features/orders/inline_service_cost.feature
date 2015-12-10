
Feature: Ship-To Addresses

  Background:
    Given I am signed in to Orders

  @inline_service_rates
  Scenario:  System Calls GetRates When "Ship-To Address" is changed
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
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
    And Sign out


