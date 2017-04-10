
Feature: Ship-To Addresses

  Background:
    Given a valid user is signed in to Web Apps

  @inline_service_rates
  Scenario:  System Calls GetRates When "Ship-To Address" is changed
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo
    Then set Order Details form Ship-To to random address between zone 1 and 4
    Then expect Order Details form Service Cost inline price for "Priority Mail Large/Thick Envelope" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "PM Package" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Priority Mail Large Package" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Priority Mail Flat Rate Envelope" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Priority Mail Padded Flat Rate Envelope" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Priority Mail Legal Flat Rate Envelope" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Priority Mail Small Flat Rate Box" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Priority Mail Medium Flat Rate Box" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Priority Mail Large Flat Rate Box" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Priority Mail Regional Rate Box A" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Priority Mail Regional Rate Box B" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "PME Package" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "PME Flat Rate Envelope" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "PME Legal Flat Rate Envelope" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "PME Padded Flat Rate Envelope" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Parcel Select Ground Package" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Parcel Select Ground Large Package" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Parcel Select Ground Oversized Package" is greater than $0.01
    Then expect Order Details form Service Cost inline price for "Media Mail Package" is greater than $0.01
    Then expect Orders Grid Pounds is 0
    Then expect Orders Grid Ounces is 0
    Then expect Orders Grid Weight is 0 lb. 0 oz.
    Then Sign out


