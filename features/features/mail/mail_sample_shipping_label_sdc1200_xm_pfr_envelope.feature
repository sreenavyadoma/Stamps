Feature: Mail Sample Shipping Label - SDC-1200 - XM Padded Flat Rate Envelope



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_sdc1200_xm_pfr_envelope
  Scenario: Sample Shipping Label - SDC-1200 - XM Padded Flat Rate Envelope

    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"

    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Mail Service Priority Mail Express Padded Flat Rate Envelope
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button Sample
    Then Sign out