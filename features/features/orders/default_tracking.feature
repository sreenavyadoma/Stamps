
Feature: Tracking

  Background:
    Given I am signed in to Orders

  @tracking_defaults
  Scenario:  Print - First-Class Mail Envelope
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default

    Then Order Details: Set Ship-To to address in Zone 1

    #Then Order Details: Select Service PME Flat Rate Envelope
    #Then Order Details: Expect Service is PME Flat Rate Envelope
    #Then Order Details: Expect Tracking is USPS Tracking

    #Then Order Details: Select Service PME Padded Flat Rate Envelope
    #Then Order Details: Expect Service is PME Padded Flat Rate Envelope
    #Then Order Details: Expect Tracking is USPS Tracking

    #Then Order Details: Select Service PME Legal Flat Rate Envelope
    #Then Order Details: Expect Service is PME Legal Flat Rate Envelope
    #Then Order Details: Expect Tracking is USPS Tracking

    #Then Order Details: Select Service PME Package
    #Then Order Details: Expect Service is "Priority Mail Express Package"
    #Then Order Details: Expect Tracking is USPS Tracking

    Then Order Details: Select Service PM Large Envelope
    Then Order Details: Expect Service is PM Large Envelope
    Then Order Details: Expect Tracking is USPS Tracking

    Then Order Details: Select Service PM Package
    Then Order Details: Expect Service is PM Package
    Then Order Details: Expect Tracking is USPS Tracking

    Then Order Details: Select Service PM Large Package
    Then Order Details: Expect Service is PM Large Package
    Then Order Details: Expect Tracking is USPS Tracking

    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Expect Service is PM Flat Rate Envelope
    Then Order Details: Expect Tracking is USPS Tracking

    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Expect Service is PM Padded Flat Rate Envelope
    Then Order Details: Expect Tracking is USPS Tracking

    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Expect Service is PM Legal Flat Rate Envelope
    Then Order Details: Expect Tracking is USPS Tracking

    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Expect Service is PM Regional Rate Box A
    Then Order Details: Expect Tracking is USPS Tracking

    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Expect Service is PM Regional Rate Box B
    Then Order Details: Expect Tracking is USPS Tracking

    Then Sign out