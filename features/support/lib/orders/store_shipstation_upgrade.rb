module Stamps
  module Orders
    module Stores
      class LookingForShipStaion < StoreSettings

        # To-Do by Kaushal
        def title
          @title = StampsElement.new(browser.img(css: "")) if @title.nil? || !@title.present?
          expect(@title).to be_present
          @title
        end

        def present?
          title.present?
        end

        def header
          @header = StampsElement.new(browser.img(css: "")) if @header.nil? || !@header.present?
          expect(@header).to be_present
          @header
        end

        def check_box
          @check_box = StampsElement.new(browser.img(css: "")) if @check_box.nil? || !@check_box.present?
          expect(@check_box).to be_present
          @check_box
        end

        def sign_in_to_shipstation
          @sign_in_to_shipstation = StampsElement.new(browser.img(css: "")) if @sign_in_to_shipstation.nil? || !@sign_in_to_shipstation.present?
          expect(@sign_in_to_shipstation).to be_present
          @sign_in_to_shipstation
        end

        def close
          @close = StampsElement.new(browser.img(css: "")) if @close.nil? || !@close.present?
          expect(@close).to be_present
          @close
        end
      end

      class AddAdvancedShippingFeatures < StoreSettings

        # To-Do by Kaushal
        def dialog_header
          @dialog_header = StampsElement.new(browser.img(css: "")) if @dialog_header.nil? || !@dialog_header.present?
          expect(@dialog_header).to be_present
          @dialog_header
        end

        def present?
          dialog_header.present?
        end

        def body
          @body = StampsElement.new(browser.img(css: "")) if @body.nil? || !@body.present?
          expect(@body).to be_present
          @body
        end

        def shipstation_logo
          @shipstation_logo = StampsElement.new(browser.img(css: "")) if @shipstation_logo.nil? || !@shipstation_logo.present?
          expect(@shipstation_logo).to be_present
          @shipstation_logo
        end

        def add_features_now
          @add_features_now = StampsElement.new(browser.img(css: "")) if @add_features_now.nil? || !@add_features_now.present?
          expect(@add_features_now).to be_present
          @add_features_now
        end

        def close_by_x
          @close_by_x = StampsElement.new(browser.img(css: "")) if @close_by_x.nil? || !@close_by_x.present?
          expect(@close_by_x).to be_present
          @close_by_x
        end
      end

      class ActivateYourNewFeatures < StoreSettings

        # To-Do by Kaushal
        def body
          @body = StampsElement.new(browser.img(css: "")) if @body.nil? || !@body.present?
          expect(@body).to be_present
          @body
        end

        def present?
          header.present?
        end

        def header
          @header = StampsElement.new(browser.img(css: "")) if @header.nil? || !@header.present?
          expect(@header).to be_present
          @header
        end

        def username
          @username = StampsElement.new(browser.img(css: "")) if @username.nil? || !@username.present?
          expect(@username).to be_present
          @username
        end

        def password
          @password = StampsElement.new(browser.img(css: "")) if @password.nil? || !@password.present?
          expect(@password).to be_present
          @password
        end

        def check_box
          @check_box = StampsElement.new(browser.img(css: "")) if @check_box.nil? || !@check_box.present?
          expect(@check_box).to be_present
          @check_box
        end

        def login
          @login = StampsElement.new(browser.img(css: "")) if @login.nil? || !@login.present?
          expect(@login).to be_present
          @login
        end
      end
    end
  end
end