Feature: Examples

    Background:
        Given I am signed in to Orders

    Scenario:  Inline Rates
        And I Add a new order
        And Edit row 1 on the order grid
        Then Set Order Details Service to "Priority Mail Large/Thick Envelope"
        Then Set Order Details Service to "Priority Mail Package"
        Then Set Order Details Service to "Priority Mail Large Package"
        Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
        Then Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
        Then Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
        Then Set Order Details Service to "Priority Mail Small Flat Rate Box"
        Then Set Order Details Service to "Priority Mail Medium Flat Rate Box"
        Then Set Order Details Service to "Priority Mail Large Flat Rate Box"
        Then Set Order Details Service to "Priority Mail Regional Rate Box A"
        Then Set Order Details Service to "Priority Mail Regional Rate Box B"
        Then Set Order Details Service to "Priority Mail Express Package"
        Then Set Order Details Service to "Priority Mail Express Flat Rate Envelope"
        Then Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
        Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
        Then Set Order Details Service to "Parcel Select Ground Package"
        Then Set Order Details Service to "Parcel Select Ground Large Package"
        Then Set Order Details Service to "Parcel Select Ground Oversized Package"
        Then Set Order Details Service to "Media Mail Package"

        Then Set Order Details Pounds to 1
        Then Set Order Details Ounces to 1
        Then Set Order Details Length to 1
        Then Set Order Details Width to 1
        Then Set Order Details Height to 1
        Then Set Order Details Insured Value to $1.09


        Then Set Order Details Ship-To address to random ship to zone 1 through 4
        And Hide Order Details Form Ship-To fields

        Then Set Order Details Ship-To address to
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Media Mail Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |

      # Expectations
        Then Expect Grid Recipient to be B-01671
        Then Expect Grid Company to be Inline Rates
        Then Expect Grid Address to be 1990 E Grand Ave
        Then Expect Grid City to be El Segundo
        Then Expect Grid State to be CA
        Then Expect Grid Zip to be 90245
        Then Expect Grid Phone to be (415) 123-5555
        Then Expect Grid Email to be rtest@stamps.com
        Then Expect Grid Pounds to be 0
        Then Expect Grid Ounces to be 1
        Then Expect Grid Weight to be 0 lbs. 1 oz.
        Then Expect Grid Insured Value to be $15.00
        Then Expect Service Cost to be $0.00
        Then Expect Order Details Service Cost inline price for "First-Class Mail Postcard" to be greater than $0.35
        Then Expect Service Cost to be $0.35
        Then Expect Order Details Service Cost inline price for "Priority Mail Large/Thick Envelope" to be greater than $5.05
        Then Expect Service Cost to be $5.05
        Then Expect Order Details Service Cost inline price for "Priority Mail Package" to be greater than $5.05
        Then Expect Service Cost to be $5.05
        Then Expect Order Details Service Cost inline price for "Priority Mail Large Package" to be greater than $5.54
        Then Expect Service Cost to be $5.54
        Then Expect Order Details Service Cost inline price for "Priority Mail Flat Rate Envelope" to be greater than $5.05
        Then Expect Service Cost to be $5.05
        Then Expect Order Details Service Cost inline price for "Priority Mail Padded Flat Rate Envelope" to be greater than $5.70
        Then Expect Service Cost to be $5.70
        Then Expect Order Details Service Cost inline price for "Priority Mail Legal Flat Rate Envelope" to be greater than $5.25
        Then Expect Service Cost to be $5.25
        Then Expect Order Details Service Cost inline price for "Priority Mail Small Flat Rate Box" to be greater than $5.25
        Then Expect Service Cost to be $5.25
        Then Expect Order Details Service Cost inline price for "Medium Flat Rate Box" to be greater than $11.30
        Then Expect Service Cost to be $11.30
        Then Expect Order Details Service Cost inline price for "Priority Mail Large Flat Rate Box" to be greater than $15.80
        Then Expect Service Cost to be $15.80
        Then Expect Order Details Service Cost inline price for "Priority Mail Regional Rate Box A" to be greater than $5.32
        Then Expect Service Cost to be $5.32
        Then Expect Order Details Service Cost inline price for "Priority Mail Regional Rate Box B" to be greater than $6.16
        Then Expect Service Cost to be $6.16
        Then Expect Order Details Service Cost inline price for "Priority Mail Express Package" to be greater than $13.09
        Then Expect Service Cost to be $13.09
        Then Expect Order Details Service Cost inline price for "Priority Mail Express Flat Rate Envelope" to be greater than $18.11
        Then Expect Service Cost to be $18.11
        Then Expect Order Details Service Cost inline price for "Priority Mail Express Legal Flat Rate Envelope" to be greater than $18.11
        Then Expect Service Cost to be $18.11
        Then Expect Order Details Service Cost inline price for "Priority Mail Express Padded Flat Rate Envelope" to be greater than $44.95
        Then Expect Service Cost to be $44.95
        Then Expect Order Details Service Cost inline price for "Parcel Select Ground Package" to be greater than $5.70
        Then Expect Service Cost to be $5.70
        Then Expect Order Details Service Cost inline price for "Parcel Select Ground Large Package" to be greater than $17.75
        Then Expect Service Cost to be $17.75
        Then Expect Order Details Service Cost inline price for "Parcel Select Ground Oversized Package" to be greater than $62.99
        Then Expect Service Cost to be $62.99
        Then Expect Order Details Service Cost inline price for "Media Mail Package" to be greater than $2.72
        Then Expect Service Cost to be $2.72

        Then Expect Ounces tooltip to display - The maximum value for this field is 15
        Then Expect Pounds tooltip to display - The maximum value for this field is 70

        Then Expect Ship-To address to be;
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Media Mail Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00             | 0       | 1      | 0       | 0     | 0     |
        And Sign out

    Scenario: Priority Mail Large/Thick Envelope
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                                | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Large/Thick Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Large/Thick Envelope"
        Then Expect Ship-To address to be;
            | name                                | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Large/Thick Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Package
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                  | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Package"
        Then Expect Ship-To address to be;
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Package     | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Large Package
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Large Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Large Package"
        Then Expect Ship-To address to be;
            | name                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Large Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Flat Rate Envelope
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Flat Rate Envelope"
        Then Expect Ship-To address to be;
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Padded Flat Rate Envelope
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Padded Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Padded Flat Rate Envelope"
        Then Expect Ship-To address to be;
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Padded Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Legal Flat Rate Envelope
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                                  | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Legal Flat Rate Envelope| B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Legal Flat Rate Envelope"
        Then Expect Ship-To address to be;
            | name                                    | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Legal Flat Rate Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Small Flat Rate Box
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Small Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Small Flat Rate Box"
        Then Expect Ship-To address to be;
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Small Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Medium Flat Rate Box
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                               | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Medium Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Medium Flat Rate Box"
        Then Expect Ship-To address to be;
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Medium Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Large Flat Rate Box
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Large Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Large Flat Rate Box"
        Then Expect Ship-To address to be;
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Large Flat Rate Box | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Regional Rate Box A
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Regional Rate Box A | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Regional Rate Box A"
        Then Expect Ship-To address to be;
            | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Regional Rate Box A | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Regional Rate Box B
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Regional Rate Box B | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Regional Rate Box B"
        Then Expect Ship-To address to be;
            | name                              | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Regional Rate Box B | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Express Package
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                          | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Express Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Express Package"
        Then Expect Ship-To address to be;
            | name                          | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Express Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Express Flat Rate Envelope
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Express Flat Rate Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |

        Then Set Order Details Service to "Priority Mail Express Flat Rate Envelope"

        Then Expect Ship-To address to be;
            | name                                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Express Flat Rate Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Express Legal Flat Rate Envelope
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Express Legal Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Express Legal Flat Rate Envelope"
        Then Expect Ship-To address to be;
            | name                      | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Express Legal Flat Rate Envelope | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00             | 0       | 1      | 0       | 0     | 0     |

    Scenario: Priority Mail Express Padded Flat Rate Envelope
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Express Padded Flat Rate Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Priority Mail Express Padded Flat Rate Envelope"
        Then Expect Ship-To address to be;
            | name                                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Priority Mail Express Padded Flat Rate Envelope  | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Parcel Select Ground Package
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                  | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Parcel Select Ground Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set Order Details Service to "Parcel Select Ground Package"

    Scenario: Parcel Select Ground Large Package
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Parcel Select Ground Large Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Parcel Select Ground Large Package"
        Then Expect Ship-To address to be;
            | name                        | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Parcel Select Ground Large Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Parcel Select Ground Oversized Package
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name                            | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Parcel Select Ground Oversized Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Parcel Select Ground Oversized Package"
        Then Expect Ship-To address to be;
            | name                            | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Parcel Select Ground Oversized Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00           | 0       | 1      | 0       | 0     | 0     |

    Scenario: Media Mail Package
        And I Add a new order

        Then Set Order Details Ship-To address to
            | name               | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Media Mail Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Set order details with
            | insured_value | pounds  | ounces | length  | width | height  |
            | 0             | 0       | 1      | 0       | 0     | 0       |
        Then Set Order Details Service to "Media Mail Package"
        Then Expect Ship-To address to be;
            | name               | company                       | street_address      | city          | state | zip   | country       | phone       |  email            |
            | Media Mail Package | B-01588 Domestic USPS service | 1350 Market Street  | San Francisco | CA    | 94102 | United States | 4157988344  | rtest@stamps.com  |
        Then Expect Order details to be;
            | insured_value  | pounds  | ounces | length  | width | height  |
            | 0.00             | 0       | 1      | 0       | 0     | 0     |
        And Sign out

    Scenario: Shipping Address Management
        And I Add a new order
        Then Set Order Details Ship-From to default
        And Add Ship-From address
            |ship_from_zip  | name          | company     | street_address    | street_address2 | city          | state         | zip    | country       | phone           |
            |94105          | Euan | Betfair UK  | 201 Mission Street | Suite 700       | San Francisco | California    | 94105  | United States | (415) 123-5555  |
        Then Expect new Ship-From address was added
        And Sign out
