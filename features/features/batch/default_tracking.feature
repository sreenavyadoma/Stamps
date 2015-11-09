
Feature: Tracking

  Background:
    Given I am signed in as a batch shipper

  @tracking
  Scenario:  Print - First-Class Mail Envelope
    And I Add a new order
    Then Set Order Form Ship-From to default

    Then Set Order Form Ship-To address to random
    And Hide Order Form Ship-To fields

    Then Set Order Form Service to "Priority Mail Large/Thick Envelope"
    Then Expect Order Form Service to be "Priority Mail Large/Thick Envelope"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Package"
    Then Expect Order Form Service to be "Priority Mail Package"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Large Package"
    Then Expect Order Form Service to be "Priority Mail Large Package"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Flat Rate Envelope"
    Then Expect Order Form Service to be "Priority Mail Flat Rate Envelope"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Padded Flat Rate Envelope"
    Then Expect Order Form Service to be "Priority Mail Padded Flat Rate Envelope"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Legal Flat Rate Envelope"
    Then Expect Order Form Service to be "Priority Mail Legal Flat Rate Envelope"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Regional Rate Box A"
    Then Expect Order Form Service to be "Priority Mail Regional Rate Box A"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Regional Rate Box B"
    Then Expect Order Form Service to be "Priority Mail Regional Rate Box B"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Regional Rate Box C"
    Then Expect Order Form Service to be "Priority Mail Regional Rate Box C"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Express Package"
    Then Expect Order Form Service to be "Priority Mail Express Package"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Express Flat Rate Envelope"
    Then Expect Order Form Service to be "Priority Mail Express Flat Rate Envelope"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Expect Order Form Service to be "Priority Mail Express Padded Flat Rate Envelope"
    Then Expect Order Form Tracking to be "USPS Tracking"

    Then Set Order Form Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Expect Order Form Service to be "Priority Mail Express Legal Flat Rate Envelope"
    Then Expect Order Form Tracking to be "USPS Tracking"

    And Sign out