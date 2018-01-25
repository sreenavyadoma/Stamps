Feature: Shipping Label bugs

  Background:
    Given a valid user is signed in to Web Apps

  @bugs_shipping_label
  Scenario: WEBAPPS-6783 Reset Button Resets Starting Label Position after Print
    Then select Print On Shipping Label - Paper
    Then set Print form Mail-From to default
    Then set Print form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope

    Then select on Print Preview Panel, left side starting label
    Then expect on Print Preview Panel, left side label is selected
    Then select on Print Preview Panel, right side starting label
    Then expect on Print Preview Panel, right side label is selected

    Then reset all fields
    Then expect on Print Preview Panel, right side label is selected
    Then select on Print Preview Panel, left side starting label

    Then reset all fields
    Then expect on Print Preview Panel, left side label is selected