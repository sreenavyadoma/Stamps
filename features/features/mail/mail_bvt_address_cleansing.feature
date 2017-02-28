Feature: Address Cleansing BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_address_cleansing
  Scenario: Address Cleansing
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to default
    Then set Label form Mail-To country to United States
    Then set Label form Mail-To to address to Address Cleansing, BVT, 1350 Market Street, San Francisco, CA
    Then set Print form Pounds to 0
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then on Shipping Label Print form, Expect Domestic Address field displays Address Cleansing, BVT, 1350 Market Street, San Francisco, CA 94102
    Then Sign out