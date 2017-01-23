Feature: Don't Require weight for Flat/Regional Rate Services
  We should not require a weight value when the selected Service includes "Flat Rate" or "Regional Rate" in the name.
  Domestic Flat/Regional Rate Service List
  Priority Mail Flat Rate Envelope
  Priority Mail Padded Flat Rate Envelope
  Priority Mail Legal Flat Rate Envelope
  Priority Mail Small Flat Rate Box
  Priority Mail Medium Flat Rate Box
  Priority Mail Large Flat Rate Box
  Priority Mail Regional Rate Box A
  Priority Mail Regional Rate Box B
  Priority Mail Express Flat Rate Envelope
  Priority Mail Express Padded Flat Rate Envelope
  Priority Mail Express Legal Flat Rate Envelope

  Background:
    Given I am signed in to Orders

  @details_flat_rate_no_weight_domestic
  Scenario:  Domestic Flat
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1

    # Priority Mail Flat Rate Envelope
    Then Order Details: Select Service PM Flat Rate Envelope
    Then Order Details: Expect Service is PM Flat Rate Envelope
    Then Order Details: Expect Pounds is 0
    Then Order Details: Expect Ounces is 0
    Then Orders Grid: Expect Service is Priority Mail
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    # Priority Mail Padded Flat Rate Envelope
    Then Order Details: Select Service PM Padded Flat Rate Envelope
    Then Order Details: Expect Service is PM Padded Flat Rate Envelope
    Then Order Details: Expect Pounds is 0
    Then Order Details: Expect Ounces is 0
    Then Orders Grid: Expect Service is Priority Mail
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    # Priority Mail Legal Flat Rate Envelope
    Then Order Details: Select Service PM Legal Flat Rate Envelope
    Then Order Details: Expect Service is PM Legal Flat Rate Envelope
    Then Order Details: Expect Pounds is 0
    Then Order Details: Expect Ounces is 0
    Then Orders Grid: Expect Service is Priority Mail
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    # Priority Mail Small Flat Rate Box
    Then Order Details: Select Service PM Small Flat Rate Box
    Then Order Details: Expect Service is PM Small Flat Rate Box
    Then Order Details: Expect Pounds is 0
    Then Order Details: Expect Ounces is 0
    Then Orders Grid: Expect Service is Priority Mail
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    # Priority Mail Medium Flat Rate Box
    Then Order Details: Select Service PM Medium Flat Rate Box
    Then Order Details: Expect Service is PM Medium Flat Rate Box
    Then Order Details: Expect Pounds is 0
    Then Order Details: Expect Ounces is 0
    Then Orders Grid: Expect Service is Priority Mail
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    # Priority Mail Large Flat Rate Box
    Then Order Details: Select Service PM Large Flat Rate Box
    Then Order Details: Expect Service is PM Large Flat Rate Box
    Then Order Details: Expect Pounds is 0
    Then Order Details: Expect Ounces is 0
    Then Orders Grid: Expect Service is Priority Mail
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    # Priority Mail Regional Rate Box A
    Then Order Details: Select Service PM Regional Rate Box A
    Then Order Details: Expect Service is PM Regional Rate Box A
    Then Order Details: Expect Pounds is 0
    Then Order Details: Expect Ounces is 0
    Then Orders Grid: Expect Service is Priority Mail
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    # Priority Mail Regional Rate Box B
    Then Order Details: Select Service PM Regional Rate Box B
    Then Order Details: Expect Service is PM Regional Rate Box B
    Then Order Details: Expect Pounds is 0
    Then Order Details: Expect Ounces is 0
    Then Orders Grid: Expect Service is Priority Mail
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    # Priority Mail Express Flat Rate Envelope
    Then Order Details: Select Service PME Flat Rate Envelope
    Then Order Details: Expect Service is PME Flat Rate Envelope
    Then Order Details: Expect Pounds is 0
    Then Order Details: Expect Ounces is 0
    Then Orders Grid: Expect Service is Priority Mail Express
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    # Priority Mail Express Padded Flat Rate Envelope
    Then Order Details: Select Service PME Padded Flat Rate Envelope
    Then Order Details: Expect Service is PME Padded Flat Rate Envelope
    Then Order Details: Expect Pounds is 0
    Then Order Details: Expect Ounces is 0
    Then Orders Grid: Expect Service is Priority Mail Express
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    # Priority Mail Express Legal Flat Rate Envelope
    Then Order Details: Select Service PME Legal Flat Rate Envelope
    Then Order Details: Expect Service is PME Legal Flat Rate Envelope
    Then Order Details: Expect Pounds is 0
    Then Order Details: Expect Ounces is 0
    Then Orders Grid: Expect Service is Priority Mail Express
    Then Print Modal: Open Print Modal
    Then Print Modal: Expect Print Modal is present
    Then Print Modal: Close Print Modal

    Then Sign out
