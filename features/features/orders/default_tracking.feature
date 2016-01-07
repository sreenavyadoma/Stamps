
Feature: Tracking

  Background:
    Given I am signed in to Orders

  @tracking_defaults
  Scenario:  Print - First-Class Mail Envelope
    And I Add a new order
    Then Set Order Details Ship-From to default

    Then Set Order Details Ship-To to Random Address Between Zone 1 through 4

    #Then Set Order Details Service to "Priority Mail Express Flat Rate Envelope"
    #Then Expect Order Details Service to be "Priority Mail Express Flat Rate Envelope"
    #Then Expect Order Details Tracking to be "USPS Tracking"

    #Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
    #Then Expect Order Details Service to be "Priority Mail Express Padded Flat Rate Envelope"
    #Then Expect Order Details Tracking to be "USPS Tracking"

    #Then Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
    #Then Expect Order Details Service to be "Priority Mail Express Legal Flat Rate Envelope"
    #Then Expect Order Details Tracking to be "USPS Tracking"

    #Then Set Order Details Service to "Priority Mail Express Package"
    #Then Expect Order Details Service to be "Priority Mail Express Package"
    #Then Expect Order Details Tracking to be "USPS Tracking"

    Then Set Order Details Service to "Priority Mail Large/Thick Envelope"
    Then Expect Order Details Service to be "Priority Mail Large/Thick Envelope"
    Then Expect Order Details Tracking to be "USPS Tracking"

    Then Set Order Details Service to "Priority Mail Package"
    Then Expect Order Details Service to be "Priority Mail Package"
    Then Expect Order Details Tracking to be "USPS Tracking"

    Then Set Order Details Service to "Priority Mail Large Package"
    Then Expect Order Details Service to be "Priority Mail Large Package"
    Then Expect Order Details Tracking to be "USPS Tracking"

    Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
    Then Expect Order Details Service to be "Priority Mail Flat Rate Envelope"
    Then Expect Order Details Tracking to be "USPS Tracking"

    Then Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
    Then Expect Order Details Service to be "Priority Mail Padded Flat Rate Envelope"
    Then Expect Order Details Tracking to be "USPS Tracking"

    Then Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
    Then Expect Order Details Service to be "Priority Mail Legal Flat Rate Envelope"
    Then Expect Order Details Tracking to be "USPS Tracking"

    Then Set Order Details Service to "Priority Mail Regional Rate Box A"
    Then Expect Order Details Service to be "Priority Mail Regional Rate Box A"
    Then Expect Order Details Tracking to be "USPS Tracking"

    Then Set Order Details Service to "Priority Mail Regional Rate Box B"
    Then Expect Order Details Service to be "Priority Mail Regional Rate Box B"
    Then Expect Order Details Tracking to be "USPS Tracking"

    And Sign out