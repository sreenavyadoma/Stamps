Feature: Extra Services BVT



  Background:
    Given I am signed in as a postage shipper

  @wp_bvt
  @wp_contacts
  Scenario: Contacts

    Then Print Postage: Select Print On Shipping Label - 5 ½” x 8 ½”
    Then Shipping Labels: Set Ship-From to default
    Then Shipping Labels: Set Ship-To country to United States
    Then Shipping Labels: Open Contacts modal
    Then Contacts: Click Contacts Page Link
    Then Sign out