Feature: Select Email Tracking for order when printing

  Background:
    Given A user is signed in to Orders

  @print_dialog_email_tracking
  Scenario: Email Tracking

    Then In Orders Toolbar, click Add button
    Then On Order Details form, set Ship-From to default
    Then On Order Details form, set Ship-To to Domestic Address MM Package, 5.5x8.5 Right Side 2, 4937 79th St., Sacramento CA 95820-6213
    Then On Order Details form, select service MM Package
    Then On Order Details form, set Ounces to 1
    Then In Orders Toolbar, click Print button
    Then In Print modal, set Print-On to "Shipping Label - 5 ½" x 8 ½""
    Then In Print modal, check Email Tracking Details to Recipients
    Then In Print modal, click Print button
    Then Sign out