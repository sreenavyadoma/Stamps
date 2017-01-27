Feature: Don't Require weight for Flat/Regional Rate Services
  We should not require a weight value when the selected service includes "Flat Rate" or "Regional Rate" in the name.
  Domestic Flat/Regional Rate service List
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
    Given a valid user is signed in to Web Apps

  @details_flat_rate_no_weight_domestic
  Scenario:  Domestic Flat
    Then in Orders Toolbar, click Add button
    Then on Order Details form, set Ship-From to default
    Then on Order Details form, set Ship-To to address in Zone 1

    # Priority Mail Flat Rate Envelope
    Then on Order Details form, select service PM Flat Rate Envelope
    Then on Order Details form, expect service is PM Flat Rate Envelope
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Padded Flat Rate Envelope
    Then on Order Details form, select service PM Padded Flat Rate Envelope
    Then on Order Details form, expect service is PM Padded Flat Rate Envelope
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Legal Flat Rate Envelope
    Then on Order Details form, select service PM Legal Flat Rate Envelope
    Then on Order Details form, expect service is PM Legal Flat Rate Envelope
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Small Flat Rate Box
    Then on Order Details form, select service PM Small Flat Rate Box
    Then on Order Details form, expect service is PM Small Flat Rate Box
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Medium Flat Rate Box
    Then on Order Details form, select service PM Medium Flat Rate Box
    Then on Order Details form, expect service is PM Medium Flat Rate Box
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Large Flat Rate Box
    Then on Order Details form, select service PM Large Flat Rate Box
    Then on Order Details form, expect service is PM Large Flat Rate Box
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Regional Rate Box A
    Then on Order Details form, select service PM Regional Rate Box A
    Then on Order Details form, expect service is PM Regional Rate Box A
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Regional Rate Box B
    Then on Order Details form, select service PM Regional Rate Box B
    Then on Order Details form, expect service is PM Regional Rate Box B
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Express Flat Rate Envelope
    Then on Order Details form, select service PME Flat Rate Envelope
    Then on Order Details form, expect service is PME Flat Rate Envelope
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail Express
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Express Padded Flat Rate Envelope
    Then on Order Details form, select service PME Padded Flat Rate Envelope
    Then on Order Details form, expect service is PME Padded Flat Rate Envelope
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail Express
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Express Legal Flat Rate Envelope
    Then on Order Details form, select service PME Legal Flat Rate Envelope
    Then on Order Details form, expect service is PME Legal Flat Rate Envelope
    Then on Order Details form, expect Pounds is 0
    Then on Order Details form, expect Ounces is 0
    Then In Orders Grid, expect service is Priority Mail Express
    Then in Orders Toolbar, click Print button
    Then in Print modal, expect Print Modal is present
    Then in Print modal, click Close button

    Then Sign out
