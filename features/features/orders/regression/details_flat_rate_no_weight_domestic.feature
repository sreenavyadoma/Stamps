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
  PME Flat Rate Envelope
  PME Padded Flat Rate Envelope
  PME Legal Flat Rate Envelope

  Background:
    Given a valid user is signed in to Web Apps

  @details_flat_rate_no_weight_domestic
  Scenario:  Domestic Flat
    Then click Orders Toolbar Add button
    Then set Order Details form Ship-From to default
    Then set Order Details form Ship-To to random address in zone 1

    # Priority Mail Flat Rate Envelope
    Then set Order Details form service to PM Flat Rate Envelope
    Then expect Order Details form service is PM Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Padded Flat Rate Envelope
    Then set Order Details form service to PM Padded Flat Rate Envelope
    Then expect Order Details form service is PM Padded Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Legal Flat Rate Envelope
    Then set Order Details form service to PM Legal Flat Rate Envelope
    Then expect Order Details form service is PM Legal Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Small Flat Rate Box
    Then set Order Details form service to PM Small Flat Rate Box
    Then expect Order Details form service is PM Small Flat Rate Box
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Medium Flat Rate Box
    Then set Order Details form service to PM Medium Flat Rate Box
    Then expect Order Details form service is PM Medium Flat Rate Box
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Large Flat Rate Box
    Then set Order Details form service to PM Large Flat Rate Box
    Then expect Order Details form service is PM Large Flat Rate Box
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Regional Rate Box A
    Then set Order Details form service to PM Regional Rate Box A
    Then expect Order Details form service is PM Regional Rate Box A
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # Priority Mail Regional Rate Box B
    Then set Order Details form service to PM Regional Rate Box B
    Then expect Order Details form service is PM Regional Rate Box B
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # PME Flat Rate Envelope
    Then set Order Details form service to PME Flat Rate Envelope
    Then expect Order Details form service is PME Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # PME Padded Flat Rate Envelope
    Then set Order Details form service to PME Padded Flat Rate Envelope
    Then expect Order Details form service is PME Padded Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    # PME Legal Flat Rate Envelope
    Then set Order Details form service to PME Legal Flat Rate Envelope
    Then expect Order Details form service is PME Legal Flat Rate Envelope
    Then expect Order Details form Pounds is 0
    Then expect Order Details form Ounces is 0
    Then expect Orders Grid service is Priority Mail Express
    Then in Orders Toolbar, click Print button
    Then expect Print modal Print Modal is present
    Then in Print modal, click Close button

    Then Sign out
