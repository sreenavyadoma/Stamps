module Stamps
  module Mail
    module PrintFormPanel

      class UpgradePlan < Browser::StampsModal
        attr_reader :window_title, :close_btn, :upgrade_now_btn, :not_yet_btn, :paragraph_element

        def initialize(param)
          super(param)
          @window_title = StampsElement.new(browser.div(text: "Upgrade Plan"))
          @close_btn = StampsElement.new(browser.img(text: "img[class*=close]"))
          @upgrade_now_btn = StampsElement.new(browser.span(text: "Upgrade Now"))
          @not_yet_btn = StampsElement.new(browser.span(text: "Not Yet"))
          @paragraph_element = StampsElement.new(browser.div(css: "div[id^=dialoguemodal-][id$=-innerCt][class=x-autocontainer-innerCt]"))
        end

        def present?
          window_title.present?
        end

        def close
          close_btn.click_while_present
        end

        def paragraph
          paragraph_element.text
        end

        def not_yet
          not_yet_btn.click_while_present
        end

        def upgrade_now
          upgrade_now_btn.click_while_present
          expect(browser.url).to include(param.test_env), "User rerouted to an external URL. You are no longer in #{param.test_env}. Check URL #{browser.url}"
        end
      end

      class PrintOn < Browser::StampsModal
        attr_accessor :drop_down, :text_box, :upgrade_plan
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @drop_down = StampsElement.new(browser.div(id: "printmediadroplist-1036-trigger-picker"))
          @text_box = StampsTextbox.new(browser.text_field(css: "input[name^=printmediadroplist-][name$=inputEl]"))
          @upgrade_plan = UpgradePlan.new(param)
        end

        def present?
          text_box.present?
        end

        def print_on(str)
          drop_down.click
          case str
            when /Paper/
              param.print_media = :labels
              selected_sub_str = 'Paper'
              element = browser.lis(css: "li[class*=iconShippingLabel]")[0]
            when /SDC-1200/
              param.print_media = :labels
              selected_sub_str = 'SDC-1200'
              element = browser.lis(css: "li[class*=iconShippingLabel]")[1]
            when /Shipping Label - 5 /
              param.print_media = :labels
              selected_sub_str = 'Shipping Label - 5 '
              element = browser.lis(css: "li[class*=iconShippingLabel]")[2]
            when /Envelope - #10/
              param.print_media = :envelopes
              selected_sub_str = 'Envelope - #10'
              element = browser.lis(css: "li[class*=iconEnvelope]")[0]
            when /Envelope - #9/
              param.print_media = :envelopes
              selected_sub_str = 'Envelope - #9'
              element = browser.lis(css: "li[class*=iconEnvelope]")[1]
            when /Envelope - #A9/
              param.print_media = :envelopes
              selected_sub_str = 'Envelope - #A9'
              element = browser.lis(css: "li[class*=iconEnvelope]")[2]
            when /Envelope - #6/
              param.print_media = :envelopes
              selected_sub_str = 'Envelope - #6'
              element = browser.lis(css: "li[class*=iconEnvelope]")[3]
            when /Envelope - #A2/
              param.print_media = :envelopes
              selected_sub_str = 'Envelope - #A2'
              element = browser.lis(css: "li[class*=iconEnvelope]")[4]
            when /Envelope - #7/
              param.print_media = :envelopes
              selected_sub_str = 'Envelope - #7'
              element = browser.lis(css: "li[class*=iconEnvelope]")[5]
            when /Envelope - #11/
              param.print_media = :envelopes
              selected_sub_str = 'Envelope - #11'
              element = browser.lis(css: "li[class*=iconEnvelope]")[6]
            when /Envelope - #12/
              param.print_media = :envelopes
              selected_sub_str = 'Envelope - #12'
              element = browser.lis(css: "li[class*=iconEnvelope]")[7]
            when /SDC-3610/
              param.print_media = :certified_mails
              selected_sub_str = 'SDC-3610'
              element = browser.lis(css: "li[class*=iconCertified]")[0]
            when /SDC-3710/
              param.print_media = :certified_mails
              selected_sub_str = 'SDC-3710'
              element = browser.lis(css: "li[class*=iconCertified]")[1]
            when /SDC-3910/
              param.print_media = :certified_mails_3910_3930
              selected_sub_str = 'SDC-3910'
              element = browser.lis(css: "li[class*=iconCertified]")[2]
            when /SDC-3930/
              param.print_media = :certified_mails_3910_3930
              selected_sub_str = 'SDC-3930'
              element = browser.lis(css: "li[class*=iconCertified]")[3]
            when /SDC-3810/
              param.print_media = :certified_mails_3810
              selected_sub_str = 'SDC-3810'
              element = browser.lis(css: "li[class*=iconCertified]")[4]
            when /Roll - 4" x 6"/
              param.print_media = :rolls
              selected_sub_str = 'Roll - 4'
              element = browser.lis(css: "li[class*=iconRoll]")[0]
            when /Roll - 4 /
              param.print_media = :rolls
              selected_sub_str = 'Roll - 4 '
              element = browser.lis(css: "li[class*=iconRoll]")[1]
            when /Stamps/
              param.print_media = :stamps
              selected_sub_str = 'Stamps'
              element = browser.li(css: "li[class*=iconNetStamps]")
            else
              expect(['Paper', 'SDC-1200', 'Shipping Label - 5 ', 'Envelope - #10', 'Envelope - #9', 'Envelope - #A9', 'Envelope - #7',
                      'Envelope - #11', 'Envelope - #12', 'SDC-3610', 'SDC-3710', 'SDC-3910', 'SDC-3810', 'Roll - 4 ', 'Roll - 4', 'Stamps']).to include(str)
          end

          selection = StampsElement.new(element)
          30.times do
            begin
              if selection.present?
                selection.scroll_into_view
                selection.click
                break if text_box.text.include?(selected_sub_str)
                expect(upgrade_plan).not_to be_present, "Username #{param.usr} is not provisioned to print Certified Mail in PAM #{param.test_env} - #{upgrade_plan.paragraph}"
              else
                drop_down.click unless selection.present?
              end
            rescue
              #ignore
            end
            sleep(0.15)
          end
          expect(text_box.text).to include(selected_sub_str), "Print On media selection failed. Expected textbox.text to include #{selected_sub_str}, got \"#{text_box.text}\""
          param.print_media
        end

        def tooltip(selection)
          selection_field = StampsElement.new browser.div(text: selection)
          10.times do
            drop_down.click unless selection_field.present?
            return selection_field.attribute_value "data-qtip" if selection_field.present?
          end
        end
      end

      class MailToCountry < Browser::StampsModal
        attr_reader :dom_text_area
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @dom_text_area = MailDomTextArea.new(param)
        end

        def enabled?

        end

        def domestic?
          15.times do
            sleep(0.05)
            return true if dom_text_area.present?
          end
          dom_text_area.present?
        end

        def drop_down
          StampsElement.new((domestic?)?browser.div(id: "sdc-mainpanel-matltocountrydroplist-trigger-picker"):browser.div(css: "div[id=shiptoview-international-targetEl]>div:nth-child(1)>div>div>div[id^=combo]>div>div>div[id$=trigger-picker]"))
        end

        def text_box
          StampsTextbox.new((domestic?)?browser.text_field(id: "sdc-mainpanel-matltocountrydroplist-inputEl"):browser.text_field(name: "ShipCountryCode"))
        end

        def select(str)
          geography = :domestic
          geography = :international unless str.downcase == 'united states'

          drop_down.click
          selection = StampsElement.new(browser.lis(text: str)[(domestic?)?0:1])
          10.times do
            begin
              break if text_box.text == str
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
            rescue
              #ignore
            end
          end
          expect(text_box.text).to eql(str)
          drop_down.click if selection.present?
          geography
        end
      end

      class MailToInt < Browser::StampsModal
        attr_reader :country, :name, :company, :address_1, :address_2, :city, :province, :postal_code, :phone
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @name = StampsTextbox.new(browser.text_field(name: "ShipName"))
          @company = StampsTextbox.new(browser.text_field(name: "ShipCompany"))
          @address_1 = StampsTextbox.new(browser.text_field(name: "ShipStreet1"))
          @address_2 = StampsTextbox.new(browser.text_field(name: "ShipStreet2"))
          @city = StampsTextbox.new(browser.text_field(name: "ShipCity"))
          @province = StampsTextbox.new(browser.text_field(name: "ShipState"))
          @postal_code = StampsTextbox.new(browser.text_field(name: "ShipPostalCode"))
          @phone = StampsTextbox.new(browser.text_field(css: "div[id=shiptoview-international-targetEl]>div>div>div>div>div>div>div>input[name=ShipPhone]"))
        end
      end

      class MailDomTextArea < StampsTextbox
        def initialize(param)
          super(param.browser.textarea(id: "sdc-mainpanel-shiptotextarea-inputEl"))
        end
      end

      class MailToDom < Browser::StampsModal
        attr_reader :text_area, :country
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @text_area = MailDomTextArea.new(param)
        end

        def set(address)
          text_area.click
          text_area.set(address)
          text_area.click
          text_area.double_click
          text_area.click
          text_area.double_click
          blur_out
          blur_out
          blur_out
        end
      end

      class PrintFormEmail < Browser::StampsModal

      end

      class PrintFormWeight < Browser::StampsModal
        attr_reader :auto_weigh, :weigh_button, :mail_pounds, :mail_ounces
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @auto_weigh = StampsCheckbox.new browser.input(id: "div[class*=autoweight-checkbox]>div>div>input[id^=checkbox]"), browser.table(id: "sdc-mainpanel-autoweightcheckbox"), "class", "checked"
          @weigh_btn = StampsElement.new browser.span(text: "Weigh")

          text_box = browser.text_field(name: "WeightLbs")
          inc_btn = browser.div(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-up]")
          dec_btn = browser.div(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-down]")
          @mail_pounds = StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(name: "WeightOz")
          inc_btn = browser.div(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-up]")
          dec_btn = browser.div(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-down]")
          @mail_ounces = StampsNumberField.new(text_box, inc_btn, dec_btn)
        end

        def present?
          mail_pounds.present? && mail_ounces.present?
        end
      end

      class PrintFormDimensions < Browser::StampsModal
        attr_accessor :length, :width, :height

        def initialize(param)
          super(param)
          text_box = browser.text_field(name: "Length")
          inc_btn = browser.div(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(1)>div>div>div>div[class*=up]")
          dec_btn = browser.divs(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(1)>div>div>div>div[class*=down]")
          @length = StampsNumberField.new(text_box, inc_btn, dec_btn)


          text_box = browser.text_field(name: "Width")
          inc_btn = browser.div(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(3)>div>div>div>div[class*=up]")
          dec_btn = browser.divs(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(3)>div>div>div>div[class*=down]")
          @width = StampsNumberField.new(text_box, inc_btn, dec_btn)

          text_box = browser.text_field(name: "Height")
          inc_btn = browser.div(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(5)>div>div>div>div[class*=up]")
          dec_btn = browser.divs(css: "div[id^=dimensionsview-][id$=-targetEl]>div:nth-child(5)>div>div>div>div[class*=down]")
          @height = StampsNumberField.new(text_box, inc_btn, dec_btn)
        end



      end

      class PrintFormMailFrom < Browser::StampsModal
        attr_reader :text_box, :drop_down, :manage_shipping_address
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new(browser.text_field(id: "sdc-mainpanel-shipfromdroplist-inputEl"))
          @drop_down = StampsElement.new(browser.div(id: "sdc-mainpanel-shipfromdroplist-trigger-picker"))
          @manage_shipping_address = MailManageShippingAddresses.new(param)
        end

        def present?
          text_box.present?
        end

        def selection_element(str)
          if str.downcase.include?('default')
            selection = StampsElement.new(browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*=x-boundlist-item]")[0])
          else
            # verify str is in Ship-From drop-down list of values
            lovs = []
            browser.lis(css: "ul[id^=boundlist-][id$=-listEl]>li[class*='x-boundlist-item']").each_with_index { |element, index| lovs[index] = element.text }
            expect(lovs).to include(/#{str}/), "Ship From drop-down list of values: #{lovs} does not include #{str}"
            selection = StampsElement.new(browser.li(text: /#{str}/))
          end
          StampsElement.new(selection)
        end

        def select(str)
          drop_down.click

          if str.downcase.include? "manage shipping"
            10.times do
              begin
                selection = selection_element(str)
                selection.click
                return manage_shipping_address if manage_shipping_address.present?
                drop_down.click unless selection.present?
              rescue
                #ignore
              end
            end
          else
            10.times do
              selection = selection_element(str)
              selection.click
              break if text_box.text.length > 0
              drop_down.click unless selection.present?
            end
          end
        end
      end

      class PrintFormService < Browser::StampsModal
        attr_reader :text_box, :drop_down
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @text_box = StampsTextbox.new browser.text_field(id: "sdc-mainpanel-servicedroplist-inputEl")
          @drop_down = StampsElement.new browser.div(id: "sdc-mainpanel-servicedroplist-trigger-picker")
        end

        def select(str)
          logger.info "Select service #{str}"
          selection = StampsElement.new browser.td(css: "li[id='#{data_for(:mail_services, {})[str]}']>table>tbody>tr>td[class*=text]")
          20.times do
            begin
              break if (text_box.text).include?(str)
              drop_down.click unless selection.present?
              selection.scroll_into_view
              selection.click
            rescue
              #ignore
            end
          end
          expect(text_box.text).to include(str)
          logger.info "#{text_box.text} service selected."
          selection
        end

        def cost(selection)
          cost_label = StampsElement.new browser.td css: "tr[data-qtip*='#{selection}']>td:nth-child(3)"
          20.times {
            begin
              drop_down.click unless cost_label.present?
              if cost_label.present?
                service_cost = helper.remove_dollar_sign(cost_label.text).to_f.round(2)
                logger.info "Service Cost for \"#{selection}\" is #{service_cost}"
                return service_cost
              end
            rescue
              #ignore
            end
          }
          blur_out
        end

        def tooltip(selection)
          button = drop_down
          selection_label = StampsElement.new browser.tr css: "tr[data-qtip*='#{selection}']"
          10.times {
            begin
              button.click unless selection_label.present?
              if selection_label.present?
                tooltip = selection_label.attribute_value "data-qtip"
                logger.info "Service Tooltip for \"#{selection}\" is #{tooltip}"
                return tooltip
              end
            rescue
              #ignore
            end
          }
          blur_out
        end

        def price
          StampsElement.new(browser.label(id: "sdc-mainpanel-servicepricelabel"))
        end

      end

      class StampAmount < Browser::StampsModal
        def text_box
          StampsTextbox.new(browser.text_field name: "stampAmount")
        end

        def set(value)
          text_field = text_box
          text_field.set(value)
          logger.info "Pounds set to #{text_field.text}"
        end

        def increment value
          button = StampsElement.new browser.div css: "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=up]"
          value.to_i.times do
            button.click
          end
        end

        def decrement value
          button = StampsElement.new browser.div css: "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=down]"
          value.to_i.times do
            button.click
          end
        end
      end

      class PrintFormEmail < Browser::StampsModal
        attr_reader :checkbox, :text_box
        def initialize(param)
          super(param)
          @checkbox = StampsCheckbox.new browser.input(id: "sdc-mainpanel-emailcheckbox-inputEl"), browser.table(id: "sdc-mainpanel-emailcheckbox"), "class", "checked"
          @text_box = StampsTextbox.new browser.text_field(id: "sdc-mainpanel-emailtextfield-inputEl")
        end

        def set(value)
          checkbox.check
          text_box.set(value)
        end
      end

      class MailTracking < Browser::StampsModal

        def text_box
          StampsTextbox.new browser.text_field name: "tracking"
        end

        def drop_down
          StampsElement.new(browser.divs(css: "div[class*=x-form-arrow-trigger]")[7])
        end

        def select(selection)
          logger.info "Select Tracking #{selection}"
          box = text_box
          button = drop_down
          selection_label = StampsElement.new browser.div text: selection
          10.times {
            begin
              button.click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.click
              selected_tracking = box.text
              logger.info "Selected Tracking #{selected_tracking} - #{(selected_tracking.include? selection)?"done": "tracking not selected"}"
              break if selected_tracking.include? selection
            rescue
              #ignore
            end
          }
          logger.info "Tracking selected: #{selection}"
          selection_label
        end

        def price
          StampsElement.new browser.label id: "sdc-mainpanel-trackingpricelabel"
        end
      end

      class PrintFormInsureFor < Browser::StampsModal
        def checkbox

        end

        def text_box
          StampsTextbox.new browser.text_field id: "sdc-mainpanel-insureamtnumberfield-inputEl"
        end

        def increment value

        end

        def decrement value

        end

        def price
          StampsElement.new browser.label id: "sdc-mainpanel-insurancepricelabel"
        end
      end

      class PrintFormCostCode < Browser::StampsModal
        def text_box
          StampsTextbox.new browser.text_field name: "costCodeId"
        end

        def drop_down
          buttons = browser.divs css: "div[class*=x-form-arrow-trigger]"
          button = StampsElement.new(buttons.last)
        end

        def select(selection)
          logger.info "Select Cost Code #{selection}"

          box = text_box
          button = drop_down
          selection_label = StampsElement.new browser.div text: selection
          sleep(0.35)
          10.times {
            begin
              button.click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.click
              selected_cost_code = box.text
              logger.info "Selected Cost Code #{selected_cost_code} - #{(selected_cost_code.include? selection)?"done": "cost code not selected"}"
              break if selected_cost_code.include? selection
            rescue
              #ignore
            end
          }
          logger.info "Origin Country selected: #{selection}"
          selection_label
        end

      end

      class PrintFormQuantity < Browser::StampsModal
        def text_box
          StampsTextbox.new(browser.text_field css: "input[class*='sdc-previewpanel-quantitynumberfield']")
        end

        def set(value)
          text_field = text_box
          text_field.set(value)
          logger.info "Quantity set to #{text_field.text}"
        end

        def increment value
          button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-up]")[7])
          value.to_i.times do
            button.click
          end
        end

        def decrement value
          button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-down]")[7])
          value.to_i.times do
            button.click
          end
        end
      end

      class PrintFormMailToLink < Browser::StampsModal
        attr_accessor :link, :contacts_modal

        def initialize(param)
          super(param)
          @link = StampsElement.new(browser.span(css: "label[class*=sdc-mainpanel-shiptolinkbtn]>span>span>span[id$=btnInnerEl]"))
          @contacts_modal = MailSearchContactsModal.new(param)
        end

        def click
          15.times do
            sleep(0.35)
            return contacts_modal if contacts_modal.present?
            link.click
          end
          expect(contacts_modal).to be_present
        end
      end

      class PrintFormMailTo < Browser::StampsModal
        attr_reader :address, :mail_to_link
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @country = MailToCountry.new(param)
          @mail_to_link = PrintFormMailToLink.new(param)
          @address = MailToDom.new(param)
        end

        def country(str)
          expect(@country).to be_present
          geography = @country.select(str)
          expect([:domestic, :international]).to include(geography)
          # dymanically create appropriate form per geography
          @address = MailToInt.new(param) if geography == :international
          @address = MailToDom.new(param) if geography == :domestic
        end
      end

      class PrintFormCustoms < Browser::StampsModal
        attr_reader :button, :customs_form

        def initialize(param)
          super(param)
          @button = StampsElement.new(browser.span(id: "sdc-mainpanel-editcustombtn-btnInnerEl"))
          @customs_form = Stamps::Common::Customs::CustomsInformation.new(param)
        end

        def edit_form
          15.times do
            return customs_form if customs_form.present?
            button.click
            sleep(0.35)
          end
          expect(customs_form).to be_present
        end

        def restrictions

        end

        def i_agree_to_insurance_terms
        end
      end


    end
  end
end