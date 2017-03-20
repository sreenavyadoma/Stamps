Feature: Mail Sample Shipping Label - SDC-1200 MM XM 
  
  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_sample_shipping_label_sdc1200_mm_xm
  Scenario: Sample Shipping Label - SDC-1200 - MM XM 

   #mail_print_sample_shipping_label_sdc1200_mm_package
    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service MM Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    #mail_print_sample_shipping_label_sdc1200_xm_fr_envelope
    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_sdc1200_xm_lfr_envelope
    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PME Legal Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_sdc1200_xm_package
    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PME Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_sdc1200_xm_pfr_envelope
    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PME Flat Rate Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out