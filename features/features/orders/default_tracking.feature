
Feature: Tracking

  Background:
    Given I am signed in to Orders

  @tracking_defaults
  Scenario:  Print - First-Class Mail Envelope
    Then Add New Order
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to Random Address Between Zone 1 through 4

    #Then Order Details: Set Service to "Priority Mail Express Flat Rate Envelope"
    #Then Order Details: Expect Service to be "Priority Mail Express Flat Rate Envelope"
    #Then Order Details: Expect Tracking to be "USPS Tracking"

    #Then Order Details: Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    #Then Order Details: Expect Service to be "Priority Mail Express Padded Flat Rate Envelope"
    #Then Order Details: Expect Tracking to be "USPS Tracking"

    #Then Order Details: Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    #Then Order Details: Expect Service to be "Priority Mail Express Legal Flat Rate Envelope"
    #Then Order Details: Expect Tracking to be "USPS Tracking"

    #Then Order Details: Set Service to "Priority Mail Express Package"
    #Then Order Details: Expect Service to be "Priority Mail Express Package"
    #Then Order Details: Expect Tracking to be "USPS Tracking"

    Then Order Details: Set Service to "Priority Mail Large/Thick Envelope"
    Then Order Details: Expect Service to be "Priority Mail Large/Thick Envelope"
    Then Order Details: Expect Tracking to be "USPS Tracking"

    Then Order Details: Set Service to "Priority Mail Package"
    Then Order Details: Expect Service to be "Priority Mail Package"
    Then Order Details: Expect Tracking to be "USPS Tracking"

    Then Order Details: Set Service to "Priority Mail Large Package"
    Then Order Details: Expect Service to be "Priority Mail Large Package"
    Then Order Details: Expect Tracking to be "USPS Tracking"

    Then Order Details: Set Service to "Priority Mail Flat Rate Envelope"
    Then Order Details: Expect Service to be "Priority Mail Flat Rate Envelope"
    Then Order Details: Expect Tracking to be "USPS Tracking"

    Then Order Details: Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Order Details: Expect Service to be "Priority Mail Padded Flat Rate Envelope"
    Then Order Details: Expect Tracking to be "USPS Tracking"

    Then Order Details: Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Order Details: Expect Service to be "Priority Mail Legal Flat Rate Envelope"
    Then Order Details: Expect Tracking to be "USPS Tracking"

    Then Order Details: Set Service to "Priority Mail Regional Rate Box A"
    Then Order Details: Expect Service to be "Priority Mail Regional Rate Box A"
    Then Order Details: Expect Tracking to be "USPS Tracking"

    Then Order Details: Set Service to "Priority Mail Regional Rate Box B"
    Then Order Details: Expect Service to be "Priority Mail Regional Rate Box B"
    Then Order Details: Expect Tracking to be "USPS Tracking"

    And Sign out