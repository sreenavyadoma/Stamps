Feature: Address Cleansing BVT

  Background:
    Given a valid user is signed in to Web Apps

  @mail_bvt_address_cleansing
  Scenario: Address Cleansing
    Then select Print On Shipping Label - 8 ½" x 11" Paper
    Then set Print form Mail-From to El Segundo
    Then set Print form Mail-To country to United States
    Then set Print form Mail-To to address to Address Cleansing, BVT, 1350 Market Street, San Francisco, CA
    Then set Print form Ounces to 1
    Then select Print form service PM Package
    Then expect Print form Domestic Address field displays Address Cleansing, BVT, 1350 Market Street, San Francisco, CA 94102
    Then Sign out
