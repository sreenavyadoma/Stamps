
Feature: User Views Price Next to Service Dropdown

  Background:
    Given I am signed in to Orders

  @inline_service_rates
  Scenario:  User Views Price Next to Service Dropdown
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Expect Service Cost is $0.00
    Then Details: Expect Service Cost inline price for "First-Class Mail Large Envelope/Flat" is greater than $0.01
    Then Details: Expect Service Cost inline price for "First-Class Mail Package/Thick Envelope" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Large/Thick Envelope" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Package" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Large Package" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Flat Rate Envelope" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Padded Flat Rate Envelope" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Legal Flat Rate Envelope" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Small Flat Rate Box" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Medium Flat Rate Box" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Large Flat Rate Box" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Regional Rate Box A" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Regional Rate Box B" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Express Package" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Express Flat Rate Envelope" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Express Legal Flat Rate Envelope" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Priority Mail Express Padded Flat Rate Envelope" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Parcel Select Ground Package" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Parcel Select Ground Large Package" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Parcel Select Ground Oversized Package" is greater than $0.01
    Then Details: Expect Service Cost inline price for "Media Mail Package" is greater than $0.01
    Then Grid: Expect Pounds is 0
    Then Grid: Expect Ounces is 0
    Then Grid: Expect Weight is 0 lb. 0 oz.
    Then Sign out
