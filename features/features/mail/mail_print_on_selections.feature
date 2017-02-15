Feature: Print Media Selection

  Background:
    Given a valid user is signed in to Web Apps

  @print_media_selection
  Scenario: Print Ons
    # Print Ons
    Then select Print form Print On Stamps
    Then select Print form Print On Shipping Label - 8 ½" x 11" Paper
    Then select Print form Print On Shipping Label - Stamps.com SDC-1200, 4 ¼" x 6 ¾"
    Then select Print form Print On Shipping Label - 5 ½" x 8 ½"
    Then select Print form Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then select Print form Print On Envelope - #9, 3 ⅞" x 8 ⅞"
    Then select Print form Print On Envelope - #A9, 5 ¾" x 8 ¾"
    Then select Print form Print On Envelope - #6, 3 ⅝" x 6 ½"
    Then select Print form Print On Envelope - #A2, 4 ⅜" x 5 ¾"
    Then select Print form Print On Envelope - #7, 3 ⅞" x 7 ½"
    Then select Print form Print On Envelope - #11, 4 ½" x 10 ⅜"
    Then select Print form Print On Envelope - #12, 4 ¾" x 11"
    Then select Print form Print On Roll - 4" x 6" Shipping Label
    Then select Print form Print On Roll - 4 ⅛" x 6 ¼" Shipping Label

    # Mail To
    Then select Print form Print On Shipping Label - 8 ½" x 11" Paper
    Then set Label form Mail To a random address in zone 1
    Then set Label form Mail To a random address in zone 2
    Then set Label form Mail To a random address in zone 3
    Then set Label form Mail To a random address in zone 4
    Then set Label form Mail To a random address in zone 5
    Then set Label form Mail To a random address in zone 6
    Then set Label form Mail To a random address in zone 7
    Then set Label form Mail To a random address in zone 8
    Then set Label form Mail To a random address in zone 9
    Then set Label form Mail To a random address in zone 1 through 4
    Then set Label form Mail To a random address in zone 5 through 8

    # Stamps Services
    Then select Print form Print On Stamps
    Then select Print form service FCM Post Card
    Then select Print form service FCM Letter
    Then select Print form service FCM Large Envelope
    Then select Print form service MM Package
    # Shipping Label Services
    Then select Print form Print On Shipping Label - 8 ½" x 11" Paper
    Then select Print form service FCM Large Envelope
    Then select Print form service FCM Package
    Then select Print form service PM Large Envelope
    Then select Print form service PM Package
    Then select Print form service PM Large Package
    Then select Print form service PM Flat Rate Envelope
    Then select Print form service PM Padded Flat Rate Envelope
    Then select Print form service PM Legal Flat Rate Envelope
    Then select Print form service PM Small Flat Rate Box
    Then select Print form service PM Medium Flat Rate Box
    Then select Print form service PM Large Flat Rate Box
    Then select Print form service PM Regional Rate Box A
    Then select Print form service PM Regional Rate Box B
    Then select Print form service PME Package
    Then select Print form service PME Flat Rate Envelope
    Then select Print form service PME Padded Flat Rate Envelope
    Then select Print form service PME Legal Flat Rate Envelope
    Then select Print form service MM Package
    Then select Print form service PSG Package
    Then select Print form service PSG Large Package
    Then select Print form service PSG Oversized Package
    # Envelope Services
    Then select Print form Print On Envelope - #10, 4 ⅛" x 9 ½"
    Then select Print form service FCM Letter
    # Roll Services
    Then select Print form Print On Roll - 4" x 6" Shipping Label
    Then select Print form service FCM Large Envelope
    Then select Print form service FCM Package
    Then select Print form service PM Large Envelope
    Then select Print form service PM Package
    Then select Print form service PM Large Package
    Then select Print form service PM Flat Rate Envelope
    Then select Print form service PM Padded Flat Rate Envelope
    Then select Print form service PM Legal Flat Rate Envelope
    Then select Print form service PM Small Flat Rate Box
    Then select Print form service PM Medium Flat Rate Box
    Then select Print form service PM Large Flat Rate Box
    Then select Print form service PM Regional Rate Box A
    Then select Print form service PM Regional Rate Box B
    Then select Print form service PME Package
    Then select Print form service PME Flat Rate Envelope
    Then select Print form service PME Padded Flat Rate Envelope
    Then select Print form service PME Legal Flat Rate Envelope
    Then select Print form service MM Package
    Then select Print form service PSG Package
    Then select Print form service PSG Large Package
    Then select Print form service PSG Oversized Package
    