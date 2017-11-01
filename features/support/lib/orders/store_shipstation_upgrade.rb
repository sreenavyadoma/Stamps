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
    end
  end
end