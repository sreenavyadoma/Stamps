module Stamps
  module Orders
    module Details
      class MultiOrderDetails < Browser::StampsModal
        attr_reader :ship_from, :weight, :domesticservice

        def initialize(param)
          super(param)
          @ship_from = ShipFromAddress.new(param)
          @weight = MultiOrderDetailsWeight.new(param)
          @domesticservice = DomesticService.new(param)
        end

        def blur_out
          blur_element.blur_out
        end

        def present?
          body.present?
        end

        def wait_until_present(*args)
          body.wait_until_present(*args)
        end

        def expand
          5.times do
            if collapsed_details.present?
              collapsed_details.open
            end
            break if self.present?
          end
        private
        def order_count_label
          browser.ps(css: 'b').last
        end

        public
        def order_count
          expect(order_count_label.present?).to be(true)
          StampsElement.new(order_count_label).text.gsub(/\d+/).first.to_i
        end
      end
   end

      class ShipFromAddress < Browser::StampsModal
          attr_reader :drop_down, :text_box, :manage_shipping_adddress, :blur_element

          def initialize(param)
            super(param)
            @text_box = StampsTextbox.new browser.text_field(name: "ShipFrom")
            @drop_down = StampsElement.new browser.div(css: "div[id^=shipfromdroplist][id$=trigger-picker]")
            @manage_shipping_adddress = ManageShippingAddresses.new(param)
            @blur_element = BlurOutElement.new(param)
          end

          def blur_out
            blur_element.blur_out
          end

          def select(str)
            return manage_shipping_address if manage_shipping_address.present?
            drop_down.click
            lovs = []
            browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*='x-boundlist-item']").each_with_index { |element, index| lovs[index] = element.text }

            expect(lovs).to include(/#{str}/), "Ship From drop-down list of values: #{lovs} does not include #{str}"

            selection = StampsElement.new(browser.li(text: /#{str}/))

            if str.downcase.include? "manage shipping"
              15.times do
                drop_down.click unless selection.present?
                selection.scroll_into_view
                selection.click
                sleep(0.35)
                return manage_shipping_adddress if manage_shipping_adddress.present?
                expect(manage_shipping_adddress.present?).to be(true), "Manage Shipping Address modal did not come up."
              end
            else
              10.times do
                drop_down.click unless selection.present?
                selection.scroll_into_view
                selection.click
                sleep(0.35)
                return if text_box.text.include?(str)
              end
            end
            expect(text_box.text).to include(str), "Unable to select Ship-From selection #{str}"
          end
      end

      class MultiOrderDetailsWeight < Browser::StampsModal
        attr_reader :lb, :oz
        def initialize(param)
          super(param)
          text_box = browser.text_field(name: 'WeightLbs')
          inc_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=pounds]>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=pounds]>div>div>div>div[class*=down]")
          @lb = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(name: 'WeightOz')
          inc_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=ounces]>div>div>div>div[class*=up]")
          dec_btn = browser.div(css: "div[id^=multi]>div>div>div>div[id^=weight]>div>div>div[class*=ounces]>div>div>div>div[class*=down]")
          @oz = Stamps::Browser::StampsNumberField.new(text_box, inc_btn, dec_btn)
        end
      end

      class DomesticService < Browser::StampsModal
        attr_reader :text_box, :drop_down, :blur_element
        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field(css: "div[id^=multiOrderDetailsForm]>div>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-inputWrap]>[name=service]"))
          @drop_down = StampsElement.new(browser.div(css: "div[id^=singleOrderDetailsForm-][id$=-targetEl]>div>div>div>div>div>div>div[id^=servicedroplist-][id$=-trigger-picker]"))
          @blur_element = BlurOutElement.new(param)
        end

    end
    end
  end
end

