Feature: Don't Require weight for Flat/Regional Rate Services
  We should not require a weight value when the selected service includes "Flat Rate" or "Regional Rate" in the name.

  Priority Mail International Flat Rate Envelope
  Priority Mail International Padded Flat Rate Envelope
  Priority Mail International Legal Flat Rate Envelope
  Priority Mail International Small Flat Rate Box
  Priority Mail International Medium Flat Rate Box
  Priority Mail International Large Flat Rate Box
  Priority Mail Express International Flat Rate Envelope
  Priority Mail Express International Padded Flat Rate Envelope
  Priority Mail Express International Legal Flat Rate Envelope

  Background:
    Given A user is signed in to Orders

  @details_flat_rate_no_weight_international
  Scenario:  International Flat
    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details International form, set address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | France  | random  | random  |

    # Priority Mail International Flat Rate Envelope
    Then On Order Details form, select service PMI Flat Rate Envelope
    Then On Order Details form, expect service is PMI Flat Rate Envelope
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 0
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, expect Pounds is 0
    Then On Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail International
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    # Priority Mail International Padded Flat Rate Envelope
    Then On Order Details form, select service PMI Padded Flat Rate Envelope
    Then On Order Details form, expect service is PMI Padded Flat Rate Envelope
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 0
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, expect Pounds is 0
    Then On Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail International
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    # Priority Mail International Legal Flat Rate Envelope
    Then On Order Details form, select service PMI Legal Flat Rate Envelope
    Then On Order Details form, expect service is PMI Legal Flat Rate Envelope
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 0
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, expect Pounds is 0
    Then On Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail International
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    # Priority Mail International Small Flat Rate Box
    Then On Order Details form, select service PMI Small Flat Rate Box
    Then On Order Details form, expect service is PMI Small Flat Rate Box
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 0
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, expect Pounds is 0
    Then On Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail International
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    # Priority Mail International Medium Flat Rate Box
    Then On Order Details form, select service PMI Medium Flat Rate Box
    Then On Order Details form, expect service is PMI Medium Flat Rate Box
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 0
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, expect Pounds is 0
    Then On Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail International
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    # Priority Mail International Large Flat Rate Box
    Then On Order Details form, select service PMI Large Flat Rate Box
    Then On Order Details form, expect service is PMI Large Flat Rate Box
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 0
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, expect Pounds is 0
    Then On Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail International
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    # Priority Mail Express International Flat Rate Envelope
    Then On Order Details form, select service PMEI Flat Rate Envelope
    Then On Order Details form, expect service is PMEI Flat Rate Envelope
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 0
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, expect Pounds is 0
    Then On Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail Express International
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    # Priority Mail Express International Padded Flat Rate Envelope
    Then On Order Details form, select service PMEI Padded Flat Rate Envelope
    Then On Order Details form, expect service is PMEI Padded Flat Rate Envelope
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 0
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, expect Pounds is 0
    Then On Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail Express International
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    # Priority Mail Express International Legal Flat Rate Envelope
    Then On Order Details form, select service PMEI Legal Flat Rate Envelope
    Then On Order Details form, expect service is PMEI Legal Flat Rate Envelope
    Then On Order Details form, click Edit Form button
    Then On Customs form, add associated Item 1, Description random, Qty 1, Price 1, Origin United States, Tariff 0
    Then On Customs form, check I agree to the USPS Privacy Act Statement
    Then On Customs form, click Close button
    Then On Order Details form, expect Pounds is 0
    Then On Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail Express International
    Then In Orders Toolbar, click Print button
    Then In Print modal, expect Print Modal is present
    Then In Print modal, click Close button

    Then Sign out
