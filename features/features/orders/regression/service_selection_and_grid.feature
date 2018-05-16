Feature:  service Selection & Order Grid Values

  Background:
    Given a valid user is signed in to Web Apps

  @parcel_select
  Scenario:  Rename Parcel Select
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details service to PSG Package/Flat/Thick Envelope

    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then select Filter Panel tab Shipped
    Then expect orders grid service is Parcel Select Ground

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details service to PSG Package/Flat/Thick Envelope
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then select Filter Panel tab Shipped
    Then expect orders grid service is Parcel Select Ground

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set order details service to PSG Oversized Package
    Then set order details ounces to 1
    Then click orders toolbar print button
    Then set Print modal Print-On to Shipping Label - Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then select Filter Panel tab Shipped
    Then expect orders grid service is Parcel Select Ground

    Then sign out

