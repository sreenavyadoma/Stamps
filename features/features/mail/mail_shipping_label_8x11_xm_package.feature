Feature: Mail Sample Shipping Label - 8 ½” x 11” Paper - XM Package



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_sample_shipping_label_8x11_xm_package
  Scenario: Sample Shipping Label - 8 ½” x 11” Paper - XM Package

    Then select Print On Shipping Label - 8 x 11 Paper on Print form

    Then on Shipping Label Print form, set Mail From to default
    Then set Print form Mail to country to United States
    Then on Print form, set Mail To address to zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then on Print form, select service Priority Mail Express Package
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button Sample
    Then Sign out