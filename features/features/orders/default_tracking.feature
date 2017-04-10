
Feature: Tracking

  Background:
    Given a valid user is signed in to Web Apps

  @tracking_defaults
  Scenario:  Print - First-Class Mail Envelope
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to El Segundo

    Then set Order Details form Ship-To to random address in zone 1
    Then set Order Details form Ship-To to random address in zone 1

    #Then set Order Details form service to PME Flat Rate Envelope
    #Then expect Order Details form service is PME Flat Rate Envelope
    #Then expect Order Details form Tracking is USPS Tracking

    #Then set Order Details form service to PME Padded Flat Rate Envelope
    #Then expect Order Details form service is PME Padded Flat Rate Envelope
    #Then expect Order Details form Tracking is USPS Tracking

    #Then set Order Details form service to PME Legal Flat Rate Envelope
    #Then expect Order Details form service is PME Legal Flat Rate Envelope
    #Then expect Order Details form Tracking is USPS Tracking

    #Then set Order Details form service to PME Package
    #Then expect Order Details form service is "PME Package"
    #Then expect Order Details form Tracking is USPS Tracking

    Then set Order Details form service to PM Large/Thick Envelope
    Then expect Order Details form service is PM Large/Thick Envelope
    Then expect Order Details form Tracking is USPS Tracking

    Then set Order Details form service to PM Package
    Then expect Order Details form service is PM Package
    Then expect Order Details form Tracking is USPS Tracking

    Then set Order Details form service to PM Large Package
    Then expect Order Details form service is PM Large Package
    Then expect Order Details form Tracking is USPS Tracking

    Then set Order Details form service to PM Flat Rate Envelope
    Then expect Order Details form service is PM Flat Rate Envelope
    Then expect Order Details form Tracking is USPS Tracking

    Then set Order Details form service to PM Padded Flat Rate Envelope
    Then expect Order Details form service is PM Padded Flat Rate Envelope
    Then expect Order Details form Tracking is USPS Tracking

    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then expect Order Details form service is PM Legal Flat Rate Envelope
    Then expect Order Details form Tracking is USPS Tracking

    Then set Order Details form service to PM Regional Rate Box A
    Then expect Order Details form service is PM Regional Rate Box A
    Then expect Order Details form Tracking is USPS Tracking

    Then set Order Details form service to PM Regional Rate Box B
    Then expect Order Details form service is PM Regional Rate Box B
    Then expect Order Details form Tracking is USPS Tracking

    Then Sign out