
Feature: Tracking

  Background:
    Given I am signed in to Orders

  @tracking_defaults
  Scenario:  Print - First-Class Mail Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To to address in Zone 1 through 4

    #Then Details: Select Service Priority Mail Express Flat Rate Envelope
    #Then Details: Expect Service to be Priority Mail Express Flat Rate Envelope
    #Then Details: Expect Tracking to be USPS Tracking

    #Then Details: Select Service Priority Mail Express Padded Flat Rate Envelope
    #Then Details: Expect Service to be Priority Mail Express Padded Flat Rate Envelope
    #Then Details: Expect Tracking to be USPS Tracking

    #Then Details: Select Service Priority Mail Express Legal Flat Rate Envelope
    #Then Details: Expect Service to be Priority Mail Express Legal Flat Rate Envelope
    #Then Details: Expect Tracking to be USPS Tracking

    #Then Details: Select Service Priority Mail Express Package
    #Then Details: Expect Service to be "Priority Mail Express Package"
    #Then Details: Expect Tracking to be USPS Tracking

    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Expect Service to be Priority Mail Large/Thick Envelope
    Then Details: Expect Tracking to be USPS Tracking

    Then Details: Select Service Priority Mail Package
    Then Details: Expect Service to be Priority Mail Package
    Then Details: Expect Tracking to be USPS Tracking

    Then Details: Select Service Priority Mail Large Package
    Then Details: Expect Service to be Priority Mail Large Package
    Then Details: Expect Tracking to be USPS Tracking

    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Expect Service to be Priority Mail Flat Rate Envelope
    Then Details: Expect Tracking to be USPS Tracking

    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Expect Service to be Priority Mail Padded Flat Rate Envelope
    Then Details: Expect Tracking to be USPS Tracking

    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Expect Service to be Priority Mail Legal Flat Rate Envelope
    Then Details: Expect Tracking to be USPS Tracking

    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Expect Service to be Priority Mail Regional Rate Box A
    Then Details: Expect Tracking to be USPS Tracking

    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Expect Service to be Priority Mail Regional Rate Box B
    Then Details: Expect Tracking to be USPS Tracking

    Then Sign out