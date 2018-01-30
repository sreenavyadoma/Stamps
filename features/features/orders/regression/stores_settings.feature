Feature:  All Store Management

  Background:
    Given a valid user is signed in to Web Apps

    @store_settings
    Scenario: Store Settings
      Then click orders toolbar settings button
      Then select order settings store qaclient@stamps.com
      Then click order settings stores edit button
      Then expect store settings PayPal modal is present
      Then set store settings store nickname to qaclient@stamps.com
      Then select store settings shipping service to FCM Large Envelope/Flat
      Then select store settings shipping service to FCM Package
      Then select store settings shipping service to PM Large/Thick Envelope
      Then select store settings shipping service to PM Package
      Then select store settings shipping service to PM Large Package
      Then select store settings shipping service to PM Flat Rate Envelope
      Then select store settings shipping service to PM Padded Flat Rate Envelope
      Then select store settings shipping service to PM Legal Flat Rate Envelope
      Then select store settings shipping service to PM Small Flat Rate Box
      Then select store settings shipping service to PM Medium Flat Rate Box
      Then select store settings shipping service to PM Large Flat Rate Box
      Then select store settings shipping service to PM Regional Rate Box A
      Then select store settings shipping service to PM Regional Rate Box B
      Then select store settings shipping service to PME Package/Flat/Thick Envelope
      Then select store settings shipping service to PME Flat Rate Envelope
      Then select store settings shipping service to PME Padded Flat Rate Envelope
      Then select store settings shipping service to PME Legal Flat Rate Envelope
      Then select store settings shipping service to MM Package/Flat/Thick Envelope
      Then select store settings shipping service to PSG Package/Flat/Thick Envelope
      Then select store settings shipping service to PSG Large Package
      Then select store settings shipping service to PSG Oversized Package
      Then select store settings shipping service to FCMI Large Envelope/Flat
      Then select store settings shipping service to FCMI Package/Thick Envelope
      Then select store settings shipping service to PMI Package/Flat/Thick Envelope
      Then select store settings shipping service to PMI Flat Rate Envelope
      Then select store settings shipping service to PMI Padded Flat Rate Envelope
      Then select store settings shipping service to PMI Legal Flat Rate Envelope
      Then select store settings shipping service to PMI Small Flat Rate Box
      Then select store settings shipping service to PMI Medium Flat Rate Box
      Then select store settings shipping service to PMI Large Flat Rate Box
      Then select store settings shipping service to PMI Regional Rate Box A
      Then select store settings shipping service to PMI Regional Rate Box B
      Then select store settings shipping service to PMEI Package/Flat/Thick Envelope
      Then select store settings shipping service to PMEI Flat Rate Envelope
      Then select store settings shipping service to PMEI Padded Flat Rate Envelope
      Then select store settings shipping service to PMEI Legal Flat Rate Envelope
