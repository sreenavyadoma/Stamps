Feature:  History regression

  Background:
    Given Start test driver

  @container_label_reprint
  Scenario: Container label reprint for Shipping label 8x11 paper
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs license number to a random string
    Then set customs certificate number to some random string
    Then set customs invoice number to a random string
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required
    Then set customs itn number to ITN123
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to history
    Then select eligible for container label on history filter panel
    Then select row 1 on history grid
    Then click create container label on history toolbar
    Then click selected packages on create container label
    Then expect container label modal on history is present
    Then expect number of container on container label modal is 1
    Then click print label button on container label modal
    Then click printing on drop down on ready to print modal
    Then expect Shipping Label - 8 ½" x 11" Paper is present on printing on
    Then expect Shipping Label - SDC-1200, 4 ¼" x 6 ¾" Paper is present on printing on
    Then expect Shipping Label - 5 ½" x 8 ½" is present on printing on
    Then expect Roll - 4" x 6" Shipping Label is not present on printing on;
    Then expect Roll - 4 ⅛" x 6 ¼" Shipping Label is not present on printing on
    Then click printing on drop down on ready to print modal
    Then select Shipping Label - 8 ½" x 11" Paper on printing on
    Then expect total cost on ready to print modal is 0
    Then select printer factory on ready to print modal
    Then click print button on ready to print modal
    Then sign out

  @container_label_reprint
  Scenario: Container label reprint for Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then sign-in to mail
    Then select print on Shipping Label - SDC-1200, 4 ¼" x 6 ¾"
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs license number to a random string
    Then set customs certificate number to some random string
    Then set customs invoice number to a random string
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required
    Then set customs itn number to ITN123
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to history
    Then select eligible for container label on history filter panel
    Then select row 1 on history grid
    Then click create container label on history toolbar
    Then click selected packages on create container label
    Then expect container label modal on history is present
    Then expect number of container on container label modal is 1
    Then click print label button on container label modal
    Then click printing on drop down on ready to print modal
    Then expect Shipping Label - 8 ½" x 11" Paper is present on printing on
    Then expect Shipping Label - SDC-1200, 4 ¼" x 6 ¾" Paper is present on printing on
    Then expect Shipping Label - 5 ½" x 8 ½" is present on printing on
    Then expect Roll - 4" x 6" Shipping Label is not present on printing on;
    Then expect Roll - 4 ⅛" x 6 ¼" Shipping Label is not present on printing on
    Then click printing on drop down on ready to print modal
    Then select Shipping Label - SDC-1200, 4 ¼" x 6 ¾" on printing on
    Then expect total cost on ready to print modal is 0
    Then select printer factory on ready to print modal
    Then click print button on ready to print modal
    Then sign out

  @container_label_reprint
  Scenario: Container label reprint for Shipping Label - 5 ½" x 8 ½"
    Then sign-in to mail
    Then select print on Shipping Label - 5 ½" x 8 ½"
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs license number to a random string
    Then set customs certificate number to some random string
    Then set customs invoice number to a random string
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required
    Then set customs itn number to ITN123
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to history
    Then select eligible for container label on history filter panel
    Then select row 1 on history grid
    Then click create container label on history toolbar
    Then click selected packages on create container label
    Then expect container label modal on history is present
    Then expect number of container on container label modal is 1
    Then click print label button on container label modal
    Then click printing on drop down on ready to print modal
    Then expect Shipping Label - 8 ½" x 11" Paper is present on printing on
    Then expect Shipping Label - SDC-1200, 4 ¼" x 6 ¾" Paper is present on printing on
    Then expect Shipping Label - 5 ½" x 8 ½" is present on printing on
    Then expect Roll - 4" x 6" Shipping Label is not present on printing on;
    Then expect Roll - 4 ⅛" x 6 ¼" Shipping Label is not present on printing on
    Then click printing on drop down on ready to print modal
    Then select Shipping Label - 5 ½" x 8 ½" on printing on
    Then expect total cost on ready to print modal is 0
    Then select printer factory on ready to print modal
    Then click print button on ready to print modal
    Then sign out

  @container_label_reprint
  Scenario: Container label reprint for Roll - 4" x 6" Shipping Label
    Then sign-in to mail
    Then select print on Roll - 4" x 6" Shipping Label
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs license number to a random string
    Then set customs certificate number to some random string
    Then set customs invoice number to a random string
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required
    Then set customs itn number to ITN123
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to history
    Then select eligible for container label on history filter panel
    Then select row 1 on history grid
    Then click create container label on history toolbar
    Then click selected packages on create container label
    Then expect container label modal on history is present
    Then expect number of container on container label modal is 1
    Then click print label button on container label modal
    Then expect printing on on ready to print modal is disabled
    Then expect printing on on ready to print modal is Roll - 4" x 6" Shipping Label
    Then expect total cost on ready to print modal is 0
    Then select printer factory on ready to print modal
    Then click print button on ready to print modal
    Then sign out

  @container_label_reprint
  Scenario: Container label reprint for Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then sign-in to mail
    Then select print on Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then show advanced options
    Then set print form ship-to to international address
      | name   | company | street_address1 | street_address2  | city   | province | postal_code | country| phone  |
      | random | random  | random           | random            | random | random   | random      | Italy | random  |
    Then set print form weight to lbs 0 oz 1
    Then select print form service PMI Flat Rate Envelope
    Then click print form edit customs form button
    Then expect customs i agree to the usps privacy act statement is unchecked
    Then set customs package contents to Commercial Sample
    Then set customs license number to a random string
    Then set customs certificate number to some random string
    Then set customs invoice number to a random string
    Then set customs non-delivery options to Treat as abandoned
    Then set customs internal transaction number to Required
    Then expect customs internal transaction number is Required
    Then set customs itn number to ITN123
    Then add customs associated item 1, description Item 1, qty 1, Price 1, Made In United States, Tariff 1
    Then check customs form i agree to the usps privacy act statement
    Then close customs information form
    Then set print form weight to lbs 0 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to history
    Then select eligible for container label on history filter panel
    Then select row 1 on history grid
    Then click create container label on history toolbar
    Then click selected packages on create container label
    Then expect container label modal on history is present
    Then expect number of container on container label modal is 1
    Then click print label button on container label modal
    Then expect printing on on ready to print modal is disabled
    Then expect printing on on ready to print modal is Roll - 4 ⅛" x 6 ¼" Shipping Label
    Then expect total cost on ready to print modal is 0
    Then select printer factory on ready to print modal
    Then click print button on ready to print modal
    Then sign out