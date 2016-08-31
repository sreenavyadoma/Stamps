Feature: Contacts BVT

  Background:
    Given I am signed in as a postage shipper

  @wp_bvt_contacts
  Scenario: Contacts

    Then Mail: Select Shipping Label 5 x 8
    Then Mail: Set Ship-From to default
    Then Mail: Set Ship-To country to United States
    Then Mail Shipping Labels: Open Contacts modal
    Then Contacts: Click Contacts Page Link
    Then Sign out