
  Feature: Domestic USPS service used to fulfill an order.

  Background:
    Given a valid user is signed in to Web Apps

  @shipstation_services
  Scenario:  ShipStation & Services
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then In Orders Grid, check row 1

    Then On Order Details form, set Ship-To to address in Zone 1 through 4

    Then On Order Details form, select service PM Large Envelope
    Then On Order Details form, expect service is PM Large Envelope

    Then On Order Details form, select service PM Package
    Then On Order Details form, expect service is PM Package

    Then On Order Details form, select service PM Large Package
    Then On Order Details form, expect service is PM Large Package

    Then On Order Details form, select service PM Flat Rate Envelope
    Then On Order Details form, expect service is PM Flat Rate Envelope

    Then On Order Details form, select service PM Padded Flat Rate Envelope
    Then On Order Details form, expect service is PM Padded Flat Rate Envelope

    Then On Order Details form, select service PM Legal Flat Rate Envelope
    Then On Order Details form, expect service is PM Legal Flat Rate Envelope

    Then On Order Details form, select service PM Regional Rate Box A
    Then On Order Details form, expect service is PM Regional Rate Box A

    Then On Order Details form, select service PM Regional Rate Box B
    Then On Order Details form, expect service is PM Regional Rate Box B

    Then On Order Details form, select service PME Package
    Then On Order Details form, expect service is PME Package

    Then On Order Details form, select service PME Flat Rate Envelope
    Then On Order Details form, expect service is PME Flat Rate Envelope

    Then On Order Details form, select service PME Padded Flat Rate Envelope
    Then On Order Details form, expect service is PME Padded Flat Rate Envelope

    Then On Order Details form, select service PME Legal Flat Rate Envelope
    Then On Order Details form, expect service is PME Legal Flat Rate Envelope

    Then Sign out

