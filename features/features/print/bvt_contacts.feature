Feature: Contacts BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_bvt_contacts
  Scenario: Contacts

    Then Print Postage: Select Shipping Label 5 x 8
    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Open Contacts modal
    Then Contacts: Click Contacts Page Link
    Then Sign out