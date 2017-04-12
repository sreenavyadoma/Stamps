Feature: Mail Sample Shipping Label - SDC-1200 - FCM PSG 

  Background:
    Given a valid user is signed in to Web Apps

  @mail_print_sample_shipping_label_sdc1200_fcm_psg
  Scenario: Sample Shipping Label - sdc1200 - FCM PSG Paper

   #mail_print_sample_shipping_label_sdc1200_fcm_large_envelope
    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service FCM Large Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_sdc1200_fcm_package
    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service FCM Package/Thick Envelope
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_sdc1200_psg_large_package
    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PSG Large Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_sdc1200_psg_oversized_package
    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 5 through 8
    Then set Print form Ounces to 1
    Then select Print form service PSG Oversized Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_sdc1200_psg_package
    Then select Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then set Print form Mail-From to default
    Then set Print form Mail-To Country to United States
    Then set Print form Mail-To to a random address in zone 1 through 4
    Then set Print form Ounces to 1
    Then select Print form service PSG Package
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out