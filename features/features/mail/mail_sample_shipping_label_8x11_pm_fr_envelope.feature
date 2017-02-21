Feature: Mail Sample Shipping Label - 8 ½” x 11” Paper - PM FR Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_8x11_pm_fr_envelope
  Scenario: Sample Shipping Label - 8 ½” x 11” Paper - PM FR Envelope

    Then select Print On Shipping Label - 8 x 11 Paper on Print form

    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Mail To address to zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then on Print form, select service Priority Mail Flat Rate Envelope
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button Sample
    Then Sign out