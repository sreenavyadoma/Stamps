
Feature: User Views Price Next to Service Dropdown

  Background:
    Given I am signed in to Orders

  @inline_service_rates @inline_service_rates_work
  Scenario:  User Views Price Next to Service Dropdown
    And I Add a new order
    Then Set Order Details Ship-From to default
    Then Set Order Details Ship-To address to random ship to zone 1 through 4
    Then Expect Service Cost to be $0.00
    Then Expect Order Details Service Cost inline price for "First-Class Mail Large Envelope/Flat" to be greater than $0.01
    Then Expect Order Details Service Cost inline price for "First-Class Mail Package/Thick Envelope" to be greater than $0.01
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