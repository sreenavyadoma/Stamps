module Stamps
  module Orders
    module Stores

      module ShipStationUpgradeCache
        def cache
          @cache ||= {}
        end
      end

      class LookingForShipStaion < StoreSettings
        include ShipStationUpgradeCache

        # To-Do by Kaushal
        def title
          (cache[:title].nil?||!cache[:title].present?)?cache[:title] = StampsField.new(browser.div(text: "Looking for ShipStation?")):cache[:title] if @title.nil? || !@title.present?
          expect(@title).to be_present
          @title
        end

        def present?
          title.present?
        end

        def header
          (cache[:header].nil?||!cache[:header].present?)?cache[:header] = StampsField.new(browser.ps(css: "div[id^='dialoguemodal-'][id$='-body']>div>div>label>p").first):cache[:header] if @header.nil? || !@header.present?
          expect(@header).to be_present
          @header
        end

        def check_box
          (cache[:check_box].nil?||!cache[:check_box].present?)?cache[:check_box] = StampsField.new(browser.span(css: "div[id^='dialoguemodal-'][id$='-body']>div>div>div>div>div>span")):cache[:check_box] if @check_box.nil? || !@check_box.present?
          expect(@check_box).to be_present
          @check_box
        end

        def sign_in_to_shipstation
          (cache[:sign_in_to_shipstation].nil?||!cache[:sign_in_to_shipstation].present?)?cache[:sign_in_to_shipstation] = StampsField.new(browser.span(text: "Sign in to ShipStation")):cache[:sign_in_to_shipstation] if @sign_in_to_shipstation.nil? || !@sign_in_to_shipstation.present?
          expect(@sign_in_to_shipstation).to be_present
          @sign_in_to_shipstation
        end

        def close
          (cache[:close].nil?||!cache[:close].present?)?cache[:close] = StampsField.new(browser.span(text: "Close")):cache[:close] if @close.nil? || !@close.present?
          expect(@close).to be_present
          @close
        end
      end

      class AddAdvancedShippingFeatures < StoreSettings
        include ShipStationUpgradeCache

        # To-Do by Kaushal
        def dialog_header
          (cache[:dialog_header].nil?||!cache[:dialog_header].present?)?cache[:dialog_header]=StampsField.new(browser.div(text: "Add Advanced Shipping Features!")):cache[:dialog_header] if @dialog_header.nil? || !@dialog_header.present?
          expect(@dialog_header).to be_present
          @dialog_header
        end

        def present?
          dialog_header.present?
        end

        def body
          (cache[:body].nil?||!cache[:body].present?)?cache[:body] = StampsField.new(browser.h2(text: "Free 60-day upgrade")):cache[:body] if @body.nil? || !@body.present?
          expect(@body).to be_present
          @body
        end

        def shipstation_logo
          (cache[:shipstation_logo].nil?||!cache[:shipstation_logo].present?)?cache[:shipstation_logo] = StampsField.new(browser.img(css: "img[src*=/WebSSUpgrade.gif]")):cache[:shipstation_logo] if @shipstation_logo.nil? || !@shipstation_logo.present?
          expect(@shipstation_logo).to be_present
          @shipstation_logo
        end

        def add_features_now
          (cache[:add_features_now].nil?||!cache[:add_features_now].present?)?cache[:add_features_now] = StampsField.new(browser.span(text: "Add New Features")):cache[:add_features_now] if @add_features_now.nil? || !@add_features_now.present?
          expect(@add_features_now).to be_present
          @add_features_now
        end

        def close_by_x
          (cache[:close_by_x].nil?||!cache[:close_by_x].present?)?cache[:close_by_x] = StampsField.new(browser.img(css: "img[class^='x-tool-img'][src*=/image/gif]")):cache[:close_by_x] if @close_by_x.nil? || !@close_by_x.present?
          expect(@close_by_x).to be_present
          @close_by_x
        end
      end

      class ActivateYourNewFeatures < StoreSettings
        include ShipStationUpgradeCache

        # To-Do by Kaushal
        def body
          (cache[:body].nil?||!cache[:body].present?)?cache[:body] = StampsField.new(browser.p(text: "Simply log in to Ship Station using your Stamps.com Username and Password.")):cache[:body] if @body.nil? || !@body.present?
          expect(@body).to be_present
          @body
        end

        def present?
          header.present?
        end

        def header
          (cache[:header].nil?||!cache[:header].present?)?cache[:header] = StampsField.new(browser.div(text: "Activate Your New Features")):cache[:header] if @header.nil? || !@header.present?
          expect(@header).to be_present
          @header
        end

        def username
          (cache[:username].nil?||!cache[:username].present?)?cache[:username] = StampsField.new(browser.input(css: "div[id^='shipstationloginview-'][id$='-targetEl']>div>div>div>div>div>div>div>div[class*='readonly']>div>div>div>input[id^='textfield-']")):cache[:username] if @username.nil? || !@username.present?
          expect(@username).to be_present
          @username
        end

        def password
          (cache[:password].nil?||!cache[:password].present?)?cache[:password] = StampsField.new(browser.input(css: "div[id^='shipstationloginview-'][id$='-targetEl']>div>div>div>div>div>div>div>div[class*='password']>div>div>div>input[id^='textfield-']")):cache[:password] if @password.nil? || !@password.present?
          expect(@password).to be_present
          @password
        end

        def check_box
          (cache[:check_box].nil?||!cache[:check_box].present?)?cache[:check_box] = StampsField.new(browser.span(css: "div[id^='shipstationloginview-'][id$='-targetEl']>div>div>div>div>div[class*='checkbox']>div>div>span[id^='checkbox-'][id$='checkbox-1505-displayEl']")):cache[:check_box] if @check_box.nil? || !@check_box.present?
          expect(@check_box).to be_present
          @check_box
        end

        def login
          (cache[:login].nil?||!cache[:login].present?)?cache[:login] = StampsField.new(browser.span(text: "Log In")):cache[:login] if @login.nil? || !@login.present?
          expect(@login).to be_present
          @login
        end
      end
    end
  end
end