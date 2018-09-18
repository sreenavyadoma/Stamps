Feature:  Mail Print Form Message Notifications

  Background:
    Given Start test driver

  @priority_mail_insurance_notification
  Scenario: WEBAPPS-11390 Priority Mail insurance yellow notification bar is not triggered
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to address to Priority Mail, Insurance Yellow Notification, 1350 Market Street #2905, San Francisco CA 94102
    Then select print form service PM Package
    Then set print form insure for to $50
    Then expect print form message toolbar is present
    Then expect print form message toolbar reads When using Priority Mail the USPS includes up to $50 of insurance at no charge to you.
    Then sign out





