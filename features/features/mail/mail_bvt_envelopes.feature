Feature: Envelopes BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_envelopes
  Scenario: Envelope
    Then select Print On Envelope 10 on Print form
    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then set Mail To address to zone 1 on Envelope form
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then set service to First-Class Mail Letter on Envelope form
    Then click Print form Print button
    Then select Printer factory on Mail print modal
    Then click Print button on Mail Print modal
    Then Sign out

  @mail_bvt_envelopes2
  Scenario: Envelope
    Then on Print form, select Envelope 10
    Then on Envelope form, set Mail From to default
    Then on Envelope form, set Mail To country to United States
    Then on Envelope form, set Mail To address to zone 1 through 4
    Then on Envelope form, set Pounds to 0
    Then on Envelope form, set Ounces to 1
    Then on Envelope form, set service to First-Class Mail Letter
    Then on Envelope form, set Include Return Address to Checked
    Then on Envelope form, set Include Delivery Address to Unchecked
   # Then on Envelope form, set Include Mail to Unchecked
    Then on Envelope form, set Reference Number to 43223
    Then on Envelope form, set Cost Code to None
    Then click Print button on Mail Print modal
    Then Sign out

