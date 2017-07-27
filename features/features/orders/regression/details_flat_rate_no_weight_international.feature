Feature: Don't Require weight for Flat/Regional Rate Services
  We should not require a weight value when the selected service includes "Flat Rate" or "Regional Rate" in the name.

  Priority Mail International Flat Rate Envelope
  Priority Mail International Padded Flat Rate Envelope
  Priority Mail International Legal Flat Rate Envelope
  Priority Mail International Small Flat Rate Box
  Priority Mail International Medium Flat Rate Box
  Priority Mail International Large Flat Rate Box
  PME International Flat Rate Envelope
  PME International Padded Flat Rate Envelope
  PME International Legal Flat Rate Envelope

  Background:
    Given a valid user is signed in to Web Apps

  @details_flat_rate_no_weight_international
  Scenario:  International Flat
    Then add new order
    Then set Order Details form Ship-From to default
    Then set Order Details Ship-To International address to
      | full_name   | company | street_address_1 | street_address_2 | city   | province| postal_code | country | phone   |  email  |
      | random | random  | random           | random           | random | random  | random      | France  | random  | random  |

    # Priority Mail International Flat Rate Envelope
    Then set Order Details form service to PMI Flat Rate Envelope
    Then expect Order Details form service is PMI Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail International Padded Flat Rate Envelope
    Then set Order Details form service to PMI Padded Flat Rate Envelope
    Then expect Order Details form service is PMI Padded Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail International Legal Flat Rate Envelope
    Then set Order Details form service to PMI Legal Flat Rate Envelope
    Then expect Order Details form service is PMI Legal Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail International Small Flat Rate Box
    Then set Order Details form service to PMI Small Flat Rate Box
    Then expect Order Details form service is PMI Small Flat Rate Box
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail International Medium Flat Rate Box
    Then set Order Details form service to PMI Medium Flat Rate Box
    Then expect Order Details form service is PMI Medium Flat Rate Box
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail International Large Flat Rate Box
    Then set Order Details form service to PMI Large Flat Rate Box
    Then expect Order Details form service is PMI Large Flat Rate Box
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # PME International Flat Rate Envelope
    Then set Order Details form service to PMEI Flat Rate Envelope
    Then expect Order Details form service is PMEI Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # PME International Padded Flat Rate Envelope
    Then set Order Details form service to PMEI Padded Flat Rate Envelope
    Then expect Order Details form service is PMEI Padded Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # PME International Legal Flat Rate Envelope
    Then set Order Details form service to PMEI Legal Flat Rate Envelope
    Then expect Order Details form service is PMEI Legal Flat Rate Envelope
    Then click Order Details form Edit Form button
    Then add Customs form Associated Item 1, Description random, Qty 1, Price 1, Made In United States, Tariff 0
    Then check Customs form I agree to the USPS Privacy Act Statement
    Then close Customs Information form
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express International
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then Sign out
