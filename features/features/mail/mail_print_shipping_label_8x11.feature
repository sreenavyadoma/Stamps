Feature: Mail Shipping Label - 8 ½” x 11” Paper



  Background:
    Given a valid user is signed in to Web Apps


  @mail_print_shipping_label_8x11
  Scenario: Shipping Label - 8 ½” x 11” Paper

    #mail_print_shipping_label_8x11_pm_fr_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PM Flat Rate Envelope
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    #mail_print_shipping_label_8x11_fcm_large_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print On FCM Package
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    #mail_print_shipping_label_8x11_fcm_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print On First Class Mail Package/Thick Envelope
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_mm_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service MM Package
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_pm_large_box
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Priority Mail Large Flat Rate Box
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_pm_large_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Priority Mail Large-Thick Envelope
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_pm_large_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Priority Mail Large Package
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_pm_lfr_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Priority Mail Legal Flat Rate Envelope
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_pm_medium_box
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Priority Mail Medium Flat Rate Box
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_pm_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Priority Mail Package
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_pm_pfr_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PM Padded Flat Rate Envelope
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_pm_regional_box_a
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service Priority Mail Regional Rate Box A
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_pm_regional_box_b
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Priority Mail Regional Rate Box B
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_pm_small_box
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PM Small Flat Rate Box
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_psg_large_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Parcel Select Ground Large Package
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_psg_oversized_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Parcel Select Ground Oversized Package
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_psg_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service Parcel Select Ground Package
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_xm_fr_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PME Flat Rate Envelope
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_shipping_label_8x11_xm_lfr_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PME Legal Flat Rate Envelope
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_8x11_xm_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Shipping Label Print form Mail From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 5 through 8
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PME Package
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Print button on Mail Print modal Sample

   #mail_print_shipping_label_8x11_xm_package
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PME Package
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

   #mail_print_sample_shipping_label_8x11_xm_pfr_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To Country to United States
    Then set Label form Mail-To to a random address in zone 1 through 4
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PME Padded Flat Rate Envelope
    Then on Print form, select left side starting label
    Then click Print Sample button on Print form
    Then set Mail Print modal Printer to factory
    Then click Print button on Mail Print modal Sample

   #mail_print_shipping_label_8x11_xm_pfr_envelope
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To to a random address in zone 1
    Then set Print form Ounces to 1
    Then select Print form service PME Padded Flat Rate Envelope
    Then on Print form, select left side starting label
    Then Print Postage
    Then set Mail Print modal Printer to factory
    Then click Mail Print modal Print button

    Then Sign out