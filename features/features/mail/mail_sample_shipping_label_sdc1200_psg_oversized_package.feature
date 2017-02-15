Feature: Mail Sample Shipping Label - SDC-1200 - PSG Oversized Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_sdc1200_psg_oversized_package
  Scenario: Sample Shipping Label - SDC-1200 - PSG Oversized Package

    Then select Print On Shipping Label - SDC-1200 Paper on Print form

    Then set Print form Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Mail To address to zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then on Print form, select service Parcel Select Ground Oversized Package
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button Sample
    Then Sign out