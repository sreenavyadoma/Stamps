
Feature: E-mail field error validation - "Email is required." when printing Envelopes

  Background:
    Given a valid user is signed in to Web Apps

  @mail_email_required_bug
  Scenario: E-mail field error validation - "Email is required." when printing Envelopes

    Then select Print On Shipping Label - Paper
    Then check Print form Email Tracking checkbox
    Then select Print On Envelope - 6
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Letter
    Then Print Postage

