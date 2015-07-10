@regression
Feature: B-01588 As a batch shipper, I want to able to change the Domestic USPS service used to fulfill an order.

  Background:
    Given I am signed in as a batch shipper auto08/password1

  @first_class_mail_package_thick_envelope
  Scenario: First-Class Mail Package/Thick Envelope
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | First-Class Mail Postcard | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to First-Class Mail Package/Thick Envelope
    * Expect Ship-To address to be;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | First-Class Mail Postcard | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @first_class_mail_package_thick_envelope
  Scenario: First-Class Mail Package/Thick Envelope
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | First-Class Mail Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to First-Class Mail Envelope
    * Expect Ship-To address to be;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | First-Class Mail Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @first_class_mail_large_envelope_flat
  Scenario: First-Class Mail Large Envelope/Flat
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                                 | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | First-Class Mail Large Envelope/Flat | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to First-Class Mail Large Envelope/Flat
    * Expect Ship-To address to be;
      | name                                  | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | First-Class Mail Large Envelope/Flat  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @first_class_mail_package_thick_envelope
  Scenario: First-Class Mail Package/Thick Envelope
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                                    | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | First-Class Mail Package/Thick Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to First-Class Mail Package/Thick Envelope
    * Expect Ship-To address to be;
      | name                                    | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | First-Class Mail Package/Thick Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_large_thick_envelope
  Scenario: Priority Mail Large/Thick Envelope
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                                | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Large/Thick Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Large/Thick Envelope
    * Expect Ship-To address to be;
      | name                                | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Large/Thick Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_package
  Scenario: Priority Mail Package
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                  | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Package
    * Expect Ship-To address to be;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Package     | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_large_package
  Scenario: Priority Mail Large Package
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Large Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Large Package
    * Expect Ship-To address to be;
      | name                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Large Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_flat_rate_envelope
  Scenario: Priority Mail Flat Rate Envelope
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Flat Rate Envelope
    * Expect Ship-To address to be;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_padded_flat_rate_envelope
  Scenario: Priority Mail Padded Flat Rate Envelope
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Padded Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Padded Flat Rate Envelope
    * Expect Ship-To address to be;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Padded Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_legal_flat_rate_envelope
  Scenario: Priority Mail Legal Flat Rate Envelope
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                                  | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Legal Flat Rate Envelope| B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Legal Flat Rate Envelope
    * Expect Ship-To address to be;
      | name                                    | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Legal Flat Rate Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_small_flat_rate_box
  Scenario: Priority Mail Small Flat Rate Box
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Small Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Small Flat Rate Box
    * Expect Ship-To address to be;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Small Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_medium_flat_rate_box
  Scenario: Priority Mail Medium Flat Rate Box
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                               | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Medium Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Medium Flat Rate Box
    * Expect Ship-To address to be;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Medium Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_large_flat_rate_box
  Scenario: Priority Mail Large Flat Rate Box
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Large Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Large Flat Rate Box
    * Expect Ship-To address to be;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Large Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_regional_rate_box_a
  Scenario: Priority Mail Regional Rate Box A
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Regional Rate Box A | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Regional Rate Box A
    * Expect Ship-To address to be;
      | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Regional Rate Box A | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_regional_rate_box_b
  Scenario: Priority Mail Regional Rate Box B
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Regional Rate Box B | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Regional Rate Box B
    * Expect Ship-To address to be;
      | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Regional Rate Box B | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_regional_rate_box_c
  Scenario: Priority Mail Regional Rate Box C
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Regional Rate Box C | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Regional Rate Box C
    * Expect Ship-To address to be;
      | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Regional Rate Box C | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_express_package
  Scenario: Priority Mail Express Package
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                          | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Express Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Express Package
    * Expect Ship-To address to be;
      | name                          | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Express Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_express_flat_rate_envelope
  Scenario: Priority Mail Express Flat Rate Envelope
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Express Flat Rate Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |

    * Set Service to Priority Mail Express Flat Rate Envelope

    * Expect Ship-To address to be;
      | name                                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Express Flat Rate Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_express_legal_flat_rate_envelope
  Scenario: Priority Mail Express Legal Flat Rate Envelope
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Express Legal Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Express Legal Flat Rate Envelope
    * Expect Ship-To address to be;
      | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Express Legal Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00             | 0       | 1      | 0       | 0     | 0     |

  @priority_mail_express_medium_flat_rate_box
  Scenario: Priority Mail Express Medium Flat Rate Box
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Express Medium Flat Rate Box  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Priority Mail Express Medium Flat Rate Box
    * Expect Ship-To address to be;
      | name                                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Priority Mail Express Medium Flat Rate Box  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @parcel_select_package
  Scenario: Parcel Select Package
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                  | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Parcel Select Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set Service to Parcel Select Package

  @parcel_select_large_package
  Scenario: Parcel Select Large Package
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Parcel Select Large Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Parcel Select Large Package
    * Expect Ship-To address to be;
      | name                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Parcel Select Large Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @parcel_select_oversized_package
  Scenario: Parcel Select Oversized Package
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name                            | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Parcel Select Oversized Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Parcel Select Oversized Package
    * Expect Ship-To address to be;
      | name                            | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Parcel Select Oversized Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00           | 0       | 1      | 0       | 0     | 0     |

  @media_mail_package
  Scenario: Media Mail Package
    * Add new order
    * Expect new Order ID created
    * Set Ship From to default
    * Set Receipient address to;
      | name               | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Media Mail Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Set order details with;
      | insured_value | pounds  | ounces | length  | width | height  |
      | 0             | 0       | 1      | 0       | 0     | 0       |
    * Set Service to Media Mail Package
    * Expect Ship-To address to be;
      | name               | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
      | Media Mail Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
    * Expect Order details to be;
      | insured_value  | pounds  | ounces | length  | width | height  |
      | 0.00             | 0       | 1      | 0       | 0     | 0     |
    * Sign out