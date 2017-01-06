
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

    Then Details: Select Service PM Large/Thick Envelope
    Then Details: Expect Service is PM Large/Thick Envelope
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service PM Package
    Then Details: Expect Service is PM Package
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service PM Large Package
    Then Details: Expect Service is PM Large Package
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service PM Flat Rate Envelope
    Then Details: Expect Service is PM Flat Rate Envelope
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service PM Padded Flat Rate Envelope
    Then Details: Expect Service is PM Padded Flat Rate Envelope
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service PM Legal Flat Rate Envelope
    Then Details: Expect Service is PM Legal Flat Rate Envelope
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service PM Regional Rate Box A
    Then Details: Expect Service is PM Regional Rate Box A
    Then Details: Expect Tracking is USPS Tracking

    Then Details: Select Service PM Regional Rate Box B
    Then Details: Expect Service is PM Regional Rate Box B
    Then Details: Expect Tracking is USPS Tracking

    Then Sign out