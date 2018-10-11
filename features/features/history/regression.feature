Feature:  History regression

  Background:
    Given Start test driver

  @return_label_pme
  Scenario: User creates return label with PME Package
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 8
    Then select print form service PM Flat Rate Envelope
    Then set print form weight to lbs 1 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to history
    Then select today on history filter panel
    Then select row 1 on history grid
    Then click create return label on history toolbar
    Then expect return label modal on history is present
    Then set weight on return label modal to lbs 1 oz 1
    Then select service on return label modal PME Package/Flat/Thick Envelope
    Then click continue on return label modal
    Then click send button on return label modal
    Then sign out

  @return_label_pme
  Scenario: User creates return label with PME Flat Rate Envelope
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 8
    Then select print form service PM Flat Rate Envelope
    Then set print form weight to lbs 1 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to history
    Then select today on history filter panel
    Then select row 1 on history grid
    Then click create return label on history toolbar
    Then expect return label modal on history is present
    Then set weight on return label modal to lbs 1 oz 1
    Then select service on return label modal PME Flat Rate Envelope
    Then click continue on return label modal
    Then click send button on return label modal
    Then sign out

  @return_label_pme
  Scenario: User creates return label with PME Padded Flat Rate Envelope
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 8
    Then select print form service PM Flat Rate Envelope
    Then set print form weight to lbs 1 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to history
    Then select today on history filter panel
    Then select row 1 on history grid
    Then click create return label on history toolbar
    Then expect return label modal on history is present
    Then set weight on return label modal to lbs 1 oz 1
    Then select service on return label modal PME Padded Flat Rate Envelope
    Then click continue on return label modal
    Then click send button on return label modal
    Then sign out

  @return_label_pme
  Scenario: User creates return label with PME Legal Flat Rate Envelope
    Then sign-in to mail
    Then select print on Shipping Label - 8 ½" x 11" Paper
    Then set print form mail-to to a random address in zone 8
    Then select print form service PM Flat Rate Envelope
    Then set print form weight to lbs 1 oz 1
    Then click print label
    Then click continue on confirm print modal
    Then expect postage message panel tracking label is Postage was sent to your printer. Your Tracking Number is
    Then save postage message panel tracking number
    Then navigate to history
    Then select today on history filter panel
    Then select row 1 on history grid
    Then click create return label on history toolbar
    Then expect return label modal on history is present
    Then set weight on return label modal to lbs 1 oz 1
    Then select service on return label modal PME Legal Flat Rate Envelope
    Then click continue on return label modal
    Then click send button on return label modal
    Then sign out


