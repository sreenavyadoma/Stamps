
Feature: Tracking

  Background:
    Given I am signed in to Orders

  @tracking_defaults
  Scenario:  Print - First-Class Mail Envelope
    Then Toolbar: Add
    Then Details: Set Ship-From to default

    Then Details: Set Ship-To to address in Zone 1 through 4

    #Then Details: Select Service PME Flat Rate Envelope
    #Then Details: Expect Service is PME Flat Rate Envelope
    #Then Details: Expect Tracking is USPS Tracking

    #Then Details: Select Service PME Padded Flat Rate Envelope
    #Then Details: Expect Service is PME Padded Flat Rate Envelope
    #Then Details: Expect Tracking is USPS Tracking

    #Then Details: Select Service PME Legal Flat Rate Envelope
    #Then Details: Expect Service is PME Legal Flat Rate Envelope
    #Then Details: Expect Tracking is USPS Tracking

    #Then Details: Select Service PME Package
    #Then Details: Expect Service is "Priority Mail Express Package"
    #Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service Priority Mail Large/Thick Envelope
    Then Details: Expect Service is Priority Mail Large/Thick Envelope
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service Priority Mail Package
    Then Details: Expect Service is Priority Mail Package
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service Priority Mail Large Package
    Then Details: Expect Service is Priority Mail Large Package
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service Priority Mail Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Flat Rate Envelope
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service Priority Mail Padded Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Padded Flat Rate Envelope
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service Priority Mail Legal Flat Rate Envelope
    Then Details: Expect Service is Priority Mail Legal Flat Rate Envelope
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service Priority Mail Regional Rate Box A
    Then Details: Expect Service is Priority Mail Regional Rate Box A
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service Priority Mail Regional Rate Box B
    Then Details: Expect Service is Priority Mail Regional Rate Box B
    Then Details: Expect Tracking is USPS Tracking

    Then Sign out