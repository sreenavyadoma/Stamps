
Feature: Tracking

  Background:
    Given a valid user is signed in to Web Apps

  @tracking_defaults
  Scenario:  Print - First-Class Mail Envelope
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default

    Then on Order Details form, set Ship-To to address in Zone 1

    #Then on Order Details form, select service PME Flat Rate Envelope
    #Then on Order Details form, expect service is PME Flat Rate Envelope
    #Then on Order Details form, expect Tracking is USPS Tracking

    #Then on Order Details form, select service PME Padded Flat Rate Envelope
    #Then on Order Details form, expect service is PME Padded Flat Rate Envelope
    #Then on Order Details form, expect Tracking is USPS Tracking

    #Then on Order Details form, select service PME Legal Flat Rate Envelope
    #Then on Order Details form, expect service is PME Legal Flat Rate Envelope
    #Then on Order Details form, expect Tracking is USPS Tracking

    #Then on Order Details form, select service PME Package
    #Then on Order Details form, expect service is "Priority Mail Express Package"
    #Then on Order Details form, expect Tracking is USPS Tracking

    Then on Order Details form, select service PM Large Envelope
    Then on Order Details form, expect service is PM Large Envelope
    Then on Order Details form, expect Tracking is USPS Tracking

    Then on Order Details form, select service PM Package
    Then on Order Details form, expect service is PM Package
    Then on Order Details form, expect Tracking is USPS Tracking

    Then on Order Details form, select service PM Large Package
    Then on Order Details form, expect service is PM Large Package
    Then on Order Details form, expect Tracking is USPS Tracking

    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, expect service is PM Flat Rate Envelope
    Then on Order Details form, expect Tracking is USPS Tracking

    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then on Order Details form, expect service is PM Padded Flat Rate Envelope
    Then on Order Details form, expect Tracking is USPS Tracking

    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, expect service is PM Legal Flat Rate Envelope
    Then on Order Details form, expect Tracking is USPS Tracking

    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, expect service is PM Regional Rate Box A
    Then on Order Details form, expect Tracking is USPS Tracking

    Then on Order Details form, select service PM Regional Rate Box B
    Then on Order Details form, expect service is PM Regional Rate Box B
    Then on Order Details form, expect Tracking is USPS Tracking

    Then Sign out