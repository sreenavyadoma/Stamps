Feature: Contacts BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_contacts
  Scenario: Contacts

    Then Postage: Select Shipping Label 5 x 8
    Then Postage: Set Ship-From to default
    Then Postage: Set Ship-To country to United States
    Then Postage Shipping Labels: Open Contacts modal
    Then Contacts: Click Contacts Page Link
    Then Sign out