
Feature: Test Development
  Background:
    Given I am signed in as a batch shipper

  @rob_dev1
  Scenario:
    And I Add a new order
    Then Set single-order form Ship-From to default
    Then Set single-order form Ship-To address to random
    Then Set single-order form Service to "Priority Mail Package"
    Then Expect single-order form Service to be "Priority Mail Package"

    Then Set single-order form Tracking to "USPS Tracking"
    Then Expect single-order form Tracking to be "USPS Tracking"
    Then Set single-order form Tracking to "Signature Required"
    Then Expect single-order form Tracking to be "Signature Required"

    Then Set single-order form Service to "Priority Mail Package"
    Then Expect single-order form Service to be "Priority Mail Package"
    Then Expect single-order form Tracking to be "USPS Tracking"

    Then Set single-order form Service to "Priority Mail Package"
    Then Expect single-order form Service to be "Priority Mail Package"
    Then Set single-order form Service to "Priority Mail Large Package"
    Then Expect single-order form Service to be "Priority Mail Large Package"

    Then Expect inline Service Cost for Priority Mail Large/Thick Envelope to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Package to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Large Package to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Flat Rate Envelope to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Padded Flat Rate Envelope to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Legal Flat Rate Envelope to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Small Flat Rate Box to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Medium Flat Rate Box to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Large Flat Rate Box to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Regional Rate Box A to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Regional Rate Box B to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Regional Rate Box C to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Express Package to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Express Flat Rate Envelope to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Express Legal Flat Rate Envelope to be greater than $0.01
    Then Expect inline Service Cost for Priority Mail Express Medium Flat Rate Box to be greater than $0.01
    Then Expect inline Service Cost for Parcel Select Package to be greater than $0.01
    Then Expect inline Service Cost for Parcel Select Large Package to be greater than $0.01
    Then Expect inline Service Cost for Parcel Select Oversized Package to be greater than $0.01
    Then Expect inline Service Cost for Media Mail Package to be greater than $0.01
    Then Expect order-grid Pounds to be 0
    Then Expect order-grid Ounces to be 0
    Then Expect order-grid Weight to be 0 lbs. 0 oz.
