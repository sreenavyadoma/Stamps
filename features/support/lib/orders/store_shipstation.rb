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
          (cache[:dialog_header].nil?||!cache[:dialog_header].present?)?cache[:dialog_header]=StampsField.new(browser.div(text: "Add Advanced Shipping Features!")):cache[:dialog_header]
        end

        def present?
          dialog_header.present?
        end

        def body
          (cache[:body].nil?||!cache[:body].present?)?cache[:body] = StampsField.new(browser.h2(text: "Free 60-day upgrade")):cache[:body]
        end

        def shipstation_logo
          (cache[:shipstation_logo].nil?||!cache[:shipstation_logo].present?)?cache[:shipstation_logo] = StampsField.new(browser.img(css: "div[id^='advancedfeatureswindow-']>div>div>img[src*='/WebSSUpgrade.gif']")):cache[:shipstation_logo]
        end

        def add_features_now
          (cache[:add_features_now].nil?||!cache[:add_features_now].present?)?cache[:add_features_now] = StampsField.new(browser.span(text: "Add New Features")):cache[:add_features_now]
        end

        def close_by_x
          (cache[:close_by_x].nil?||!cache[:close_by_x].present?)?cache[:close_by_x] = StampsField.new(browser.img(css: "img[class^='x-tool-img'][src*=/image/gif]")):cache[:close_by_x]
        end
      end

      class ActivateYourNewFeatures < StoreSettings
        include ShipStationUpgradeCache

        def body
          (cache[:body].nil?||!cache[:body].present?)?cache[:body] = StampsField.new(browser.p(css: "div[id^='shipstationloginview-']>div>div>div>div>div>label>p")):cache[:body]
        end

        def present?
          header.present?
        end

        def header
          (cache[:header].nil?||!cache[:header].present?)?cache[:header] = StampsField.new(browser.div(text: "Activate Your New Features")):cache[:header]
        end

        def username
          (cache[:username].nil?||!cache[:username].present?)?cache[:username] = StampsField.new(browser.text_field(css: "div[id^='shipstationloginview-'][id$='-targetEl']>div>div>div>div>div>div>div>div[class*='readonly']>div>div>div>input[id^='textfield-']")):cache[:username]
        end

        def password
          (cache[:password].nil?||!cache[:password].present?)?cache[:password] = StampsTextbox.new(browser.text_field(css: "div[id^='shipstationloginview-'][id$='-targetEl']>div>div>div>div>div>div>div>div[class*='password']>div>div>div>input[id^='textfield-']")):cache[:password]
        end

        def check_box
          (cache[:check_box].nil?||!cache[:check_box].present?)?cache[:check_box] = StampsWatirCheckbox.new(browser.span(css: "div[id^='shipstationloginview-'][id$='-targetEl']>div>div>div>div>div[class*='checkbox']>div>div>span[id^='checkbox-'][id$='-displayEl']")):cache[:check_box]
        end

        def login
          (cache[:login].nil?||!cache[:login].present?)?cache[:login] = StampsField.new(browser.span(text: "Log In")):cache[:login]
        end

        def close_x
          (cache[:login].nil?||!cache[:login].present?)?cache[:login] = StampsField.new(browser.img(css: "div[id^='shipstationloginview-'][id$='-targetEl']>div>img[src*='/AMDAwAAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw=='")):cache[:login]
        end

        def password_tooltip
          (cache[:password_tooltip].nil?||!cache[:password_tooltip].present?)?cache[:password_tooltip] = StampsField.new(browser.li(css: "div[id^='shipstationloginview-'][id$='-targetEl']>div>div>div>div>div>div>div>div[class*='password']>div>div[role='alert']>ul>li")):cache[:password_tooltip]
        end

        def terms_tooltip
          (cache[:terms_tooltip].nil?||!cache[:terms_tooltip].present?)?cache[:terms_tooltip] = StampsField.new(browser.li(css: "div[id^='shipstationloginview-'][id$='-targetEl']>div>div>div>div>div[class*='checkbox']>div>div[role='alert']>ul>li")):cache[:terms_tooltip]
        end
      end
    end
  end
end