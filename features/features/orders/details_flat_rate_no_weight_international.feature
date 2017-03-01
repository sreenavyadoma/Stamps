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
    Given a valid user is signed in to Web Apps

  @details_flat_rate_no_weight_international
  Scenario:  International Flat
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then set Order Details Ship-To International address to
      | name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | France  | random  | random  |

    # Priority Mail International Flat Rate Envelope
    Then on Order Details form, select service PMI Flat Rate Envelope
    Then on Order Details form, expect service is PMI Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In is United States, Tariff 0
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then in Orders Grid, expect service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail International Padded Flat Rate Envelope
    Then on Order Details form, select service PMI Padded Flat Rate Envelope
    Then on Order Details form, expect service is PMI Padded Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In is United States, Tariff 0
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then in Orders Grid, expect service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail International Legal Flat Rate Envelope
    Then on Order Details form, select service PMI Legal Flat Rate Envelope
    Then on Order Details form, expect service is PMI Legal Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In is United States, Tariff 0
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then in Orders Grid, expect service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail International Small Flat Rate Box
    Then on Order Details form, select service PMI Small Flat Rate Box
    Then on Order Details form, expect service is PMI Small Flat Rate Box
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In is United States, Tariff 0
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then in Orders Grid, expect service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail International Medium Flat Rate Box
    Then on Order Details form, select service PMI Medium Flat Rate Box
    Then on Order Details form, expect service is PMI Medium Flat Rate Box
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In is United States, Tariff 0
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then in Orders Grid, expect service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail International Large Flat Rate Box
    Then on Order Details form, select service PMI Large Flat Rate Box
    Then on Order Details form, expect service is PMI Large Flat Rate Box
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In is United States, Tariff 0
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then in Orders Grid, expect service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Express International Flat Rate Envelope
    Then on Order Details form, select service PMEI Flat Rate Envelope
    Then on Order Details form, expect service is PMEI Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In is United States, Tariff 0
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then in Orders Grid, expect service is Priority Mail Express International
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Express International Padded Flat Rate Envelope
    Then on Order Details form, select service PMEI Padded Flat Rate Envelope
    Then on Order Details form, expect service is PMEI Padded Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In is United States, Tariff 0
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then in Orders Grid, expect service is Priority Mail Express International
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Express International Legal Flat Rate Envelope
    Then on Order Details form, select service PMEI Legal Flat Rate Envelope
    Then on Order Details form, expect service is PMEI Legal Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In is United States, Tariff 0
    Then on Customs form, check I agree to the USPS Privacy Act Statement
    Then click Customs form Close button
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then in Orders Grid, expect service is Priority Mail Express International
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    Then Sign out
