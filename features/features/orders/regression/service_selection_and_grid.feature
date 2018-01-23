Feature:  service Selection & Order Grid Values

  Background:
    Given a valid user is signed in to Web Apps

  @parcel_select
  Scenario:  Rename Parcel Select
    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PSG Package

    Then set Order Details Ounces to 1
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then select Filter Panel tab Shipped
    Then expect Orders Grid service is Parcel Select Ground

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PSG Package
    Then set Order Details Ounces to 1
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then select Filter Panel tab Shipped
    Then expect Orders Grid service is Parcel Select Ground

    Then add new order
    Then set Order Details Ship-From to default
    Then set Order Details Ship-To to random address between zone 1 and 4
    Then set Order Details service to PSG Oversized Package
    Then set Order Details Ounces to 1
    Then click Orders Toolbar Print button
    Then set Print modal Print-On to Shipping Label - Paper
    Then set Orders print modal printer
    Then click print modal print button
    Then select Filter Panel tab Shipped
    Then expect Orders Grid service is Parcel Select Ground

    Then Sign out

