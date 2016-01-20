
  Feature: Domestic USPS service used to fulfill an order.

  Background:
    Given I am signed in to Orders

  @service_control
  Scenario:  Inline Rates
    Then Add New Order
    Then Order Details - Set Ship-From to default
    And Orders Grid - Check row 1

    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Hide Ship-To fields

    Then Order Details - Set Service to "Priority Mail Large/Thick Envelope"
    Then Expect Order Details Service to be "Priority Mail Large/Thick Envelope"

    Then Order Details - Set Service to "Priority Mail Package"
    Then Expect Order Details Service to be "Priority Mail Package"

    Then Order Details - Set Service to "Priority Mail Large Package"
    Then Expect Order Details Service to be "Priority Mail Large Package"

    Then Order Details - Set Service to "Priority Mail Flat Rate Envelope"
    Then Expect Order Details Service to be "Priority Mail Flat Rate Envelope"

    Then Order Details - Set Service to "Priority Mail Padded Flat Rate Envelope"
    Then Expect Order Details Service to be "Priority Mail Padded Flat Rate Envelope"

    Then Order Details - Set Service to "Priority Mail Legal Flat Rate Envelope"
    Then Expect Order Details Service to be "Priority Mail Legal Flat Rate Envelope"

    Then Order Details - Set Service to "Priority Mail Regional Rate Box A"
    Then Expect Order Details Service to be "Priority Mail Regional Rate Box A"

    Then Order Details - Set Service to "Priority Mail Regional Rate Box B"
    Then Expect Order Details Service to be "Priority Mail Regional Rate Box B"

    Then Order Details - Set Service to "Priority Mail Express Package"
    Then Expect Order Details Service to be "Priority Mail Express Package"

    Then Order Details - Set Service to "Priority Mail Express Flat Rate Envelope"
    Then Expect Order Details Service to be "Priority Mail Express Flat Rate Envelope"

    Then Order Details - Set Service to "Priority Mail Express Padded Flat Rate Envelope"
    Then Expect Order Details Service to be "Priority Mail Express Padded Flat Rate Envelope"

    Then Order Details - Set Service to "Priority Mail Express Legal Flat Rate Envelope"
    Then Expect Order Details Service to be "Priority Mail Express Legal Flat Rate Envelope"

    And Sign out
