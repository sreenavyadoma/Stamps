
Feature: Tracking

  Background:
    Given a valid user is signed in to Web Apps

  @tracking_defaults
  Scenario:  Print - First-Class Mail Envelope
    Then in Orders Toolbar, click Add button
    Then set Order Details form Ship-From to default

    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form Ship-To to random address in zone 1

    #Then on Order Details form, select service PME Flat Rate Envelope
    #Then expect Order Details form service is PME Flat Rate Envelope
    #Then expect Order Details form Tracking is USPS Tracking

    #Then on Order Details form, select service PME Padded Flat Rate Envelope
    #Then expect Order Details form service is PME Padded Flat Rate Envelope
    #Then expect Order Details form Tracking is USPS Tracking

    #Then on Order Details form, select service PME Legal Flat Rate Envelope
    #Then expect Order Details form service is PME Legal Flat Rate Envelope
    #Then expect Order Details form Tracking is USPS Tracking

    #Then on Order Details form, select service PME Package
    #Then expect Order Details form service is "PME Package"
    #Then expect Order Details form Tracking is USPS Tracking

    Then on Order Details form, select service PM Large/Thick Envelope
    Then expect Order Details form service is PM Large/Thick Envelope
    Then expect Order Details form Tracking is USPS Tracking

    Then on Order Details form, select service PM Package
    Then expect Order Details form service is PM Package
    Then expect Order Details form Tracking is USPS Tracking

    Then on Order Details form, select service PM Large Package
    Then expect Order Details form service is PM Large Package
    Then expect Order Details form Tracking is USPS Tracking

    Then on Order Details form, select service PM Flat Rate Envelope
    Then expect Order Details form service is PM Flat Rate Envelope
    Then expect Order Details form Tracking is USPS Tracking

    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then expect Order Details form service is PM Padded Flat Rate Envelope
    Then expect Order Details form Tracking is USPS Tracking

    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then expect Order Details form service is PM Legal Flat Rate Envelope
    Then expect Order Details form Tracking is USPS Tracking

    Then on Order Details form, select service PM Regional Rate Box A
    Then expect Order Details form service is PM Regional Rate Box A
    Then expect Order Details form Tracking is USPS Tracking

    Then on Order Details form, select service PM Regional Rate Box B
    Then expect Order Details form service is PM Regional Rate Box B
    Then expect Order Details form Tracking is USPS Tracking

    Then Sign out