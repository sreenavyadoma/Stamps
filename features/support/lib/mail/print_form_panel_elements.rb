module Stamps
  module Mail
    module PrintFormPanel

      class PrintOn < Browser::StampsHtmlField
        attr_accessor :drop_down, :text_box
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @drop_down = StampsElement.new(browser.div(id: "printmediadroplist-1036-trigger-picker"))
          @text_box = StampsTextbox.new(browser.text_field(css: "input[name^=printmediadroplist-][name$=inputEl]"))
        end

        def present?
          text_box.present?
        end

        def print_on(str)
          drop_down.safe_click
          case str
            when /Paper/
              param.print_form = :paper
              selected_sub_str = 'Paper'
              element = browser.lis(css: "li[class*=iconShippingLabel]")[0]
            when /SDC-1200/
              param.print_form = :paper
              selected_sub_str = 'SDC-1200'
              element = browser.lis(css: "li[class*=iconShippingLabel]")[1]
            when /Shipping Label - 5 /
              param.print_form = :paper
              selected_sub_str = 'Shipping Label - 5 '
              element = browser.lis(css: "li[class*=iconShippingLabel]")[2]
            when /Envelope - #10/
              param.print_form = :envelopes
              selected_sub_str = 'Envelope - #10'
              element = browser.lis(css: "li[class*=iconEnvelope]")[0]
            when /Envelope - #9/
              param.print_form = :envelopes
              selected_sub_str = 'Envelope - #9'
              element = browser.lis(css: "li[class*=iconEnvelope]")[1]
            when /Envelope - #A9/
              param.print_form = :envelopes
              selected_sub_str = 'Envelope - #A9'
              element = browser.lis(css: "li[class*=iconEnvelope]")[2]
            when /Envelope - #6/
              param.print_form = :envelopes
              selected_sub_str = 'Envelope - #6'
              element = browser.lis(css: "li[class*=iconEnvelope]")[3]
            when /Envelope - #A2/
              param.print_form = :envelopes
              selected_sub_str = 'Envelope - #A2'
              element = browser.lis(css: "li[class*=iconEnvelope]")[4]
            when /Envelope - #7/
              param.print_form = :envelopes
              selected_sub_str = 'Envelope - #7'
              element = browser.lis(css: "li[class*=iconEnvelope]")[5]
            when /Envelope - #11/
              param.print_form = :envelopes
              selected_sub_str = 'Envelope - #11'
              element = browser.lis(css: "li[class*=iconEnvelope]")[6]
            when /Envelope - #12/
              param.print_form = :envelopes
              selected_sub_str = 'Envelope - #12'
              element = browser.lis(css: "li[class*=iconEnvelope]")[7]
            when /SDC-3610/
              param.print_form = :envelopes
              selected_sub_str = 'SDC-3610'
              element = browser.lis(css: "li[class*=iconCertified]")[0]
            when /SDC-3710/
              param.print_form = :envelopes
              selected_sub_str = 'SDC-3710'
              element = browser.lis(css: "li[class*=iconCertified]")[1]
            when /SDC-3910/
              param.print_form = :envelopes
              selected_sub_str = 'SDC-3910'
              element = browser.lis(css: "li[class*=iconCertified]")[2]
            when /SDC-3810/
              param.print_form = :envelopes
              selected_sub_str = 'SDC-3810'
              element = browser.lis(css: "li[class*=iconCertified]")[3]
            when /Roll - 4" x 6"/
              param.print_form = :rolls
              selected_sub_str = 'Roll - 4'
              element = browser.lis(css: "li[class*=iconRoll]")[0]
            when /Roll - 4 /
              param.print_form = :rolls
              selected_sub_str = 'Roll - 4 '
              element = browser.lis(css: "li[class*=iconRoll]")[1]
            when /Stamps/
              param.print_form = :stamps
              selected_sub_str = 'Stamps'
              element = browser.li(css: "li[class*=iconNetStamps]")
            else
              expect(['Paper', 'SDC-1200', 'Shipping Label - 5 ', 'Envelope - #10', 'Envelope - #9', 'Envelope - #A9', 'Envelope - #7',
                      'Envelope - #11', 'Envelope - #12', 'SDC-3610', 'SDC-3710', 'SDC-3910', 'SDC-3810', 'Roll - 4 ', 'Roll - 4', 'Stamps']).to include(str)
          end

          selection = StampsElement.new(element)
          10.times do
            begin
              if selection.present?
                selection.scroll_into_view
                selection.safe_click
                break if text_box.text.include?(selected_sub_str)
              else
                drop_down.safe_click unless selection.present?
              end
            rescue
              #ignore
            end
            sleep(0.15)
          end
          expect(text_box.text).to include(selected_sub_str)
          param.print_form
        end

        def tooltip(selection)
          selection_field = StampsElement.new browser.div(text: selection)
          10.times do
            drop_down.safe_click unless selection_field.present?
            return selection_field.attribute_value "data-qtip" if selection_field.present?
          end
        end
      end

      class MailToCountry < Browser::StampsHtmlField
        attr_reader :text_box, :drop_down, :index
        include PrintFormBlurOut

        def initialize(param, index)
          super(param)
          @index = index
          @text_box = StampsTextbox.new(browser.text_field(id: "sdc-mainpanel-matltocountrydroplist-inputEl"))
          @drop_down = StampsElement.new(browser.div(css: "sdc-mainpanel-matltocountrydroplist-trigger-picker"))
        end

        def select(selection)
          selection_label = StampsElement.new browser.lis(text: selection)[index]
          20.times {
            begin
              break if text_box.text.include?(selection)
              drop_down.safe_click unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
              sleep(0.125)
            rescue
              #ignore
            end
          }
        end
      end

      class MailToInt < Browser::StampsHtmlField
        attr_reader :country, :name, :company, :address_1, :address_2, :city, :province, :postal_code, :phone
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @country = MailToCountry.new(param, 1)
          @name = StampsTextbox.new(browser.text_field(name: "ShipName"))
          @company = StampsTextbox.new(browser.text_field(name: "ShipCompany"))
          @address_1 = StampsTextbox.new(browser.text_field(name: "ShipStreet1"))
          @address_2 = StampsTextbox.new(browser.text_field(name: "ShipStreet2"))
          @city = StampsTextbox.new(browser.text_field(name: "ShipCity"))
          @province = StampsTextbox.new(browser.text_field(name: "ShipState"))
          @postal_code = StampsTextbox.new(browser.text_field(name: "ShipPostalCode"))
          @phone = StampsTextbox.new(browser.text_field(name: "ShipPhone"))
        end
      end

      class MailToDom < Browser::StampsHtmlField
        attr_reader :text_area, :country
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @country = MailToCountry.new(param, 0)
          @text_area = StampsTextbox.new(browser.textarea(id: "sdc-mainpanel-shiptotextarea-inputEl"))
        end

        def set(address)
          text_area.safe_click
          text_area.set(address)
          text_area.safe_click
          text_area.safe_double_click
          text_area.safe_click
          text_area.safe_double_click
          blur_out
          blur_out
          blur_out
        end
      end

      class PrintFormEmail < Browser::StampsHtmlField

      end

      class PrintFormWeight < Browser::StampsHtmlField
        attr_reader :auto_weigh, :weigh_button, :mail_pounds, :mail_ounces
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @auto_weigh = StampsCheckbox.new browser.input(id: "div[class*=autoweight-checkbox]>div>div>input[id^=checkbox]"), browser.table(id: "sdc-mainpanel-autoweightcheckbox"), "class", "checked"
          @weigh_btn = StampsElement.new browser.span(text: "Weigh")

          text_box = browser.text_field(name: "WeightLbs")
          inc_btn = browser.div(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-up]")
          dec_btn = browser.divs(css: "div[class*=pounds-numberfield]>div>div>div>div[class*=spinner-down]")
          @mail_pounds = StampsNumberField.new(param, text_box, inc_btn, dec_btn, 'Pounds')

          text_box = browser.text_field(name: "WeightOz")
          inc_btn = browser.div(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-up]")
          dec_btn = browser.divs(css: "div[class*=ounces-numberfield]>div>div>div>div[class*=spinner-down]")
          @mail_ounces = StampsNumberField.new(param, text_box, inc_btn, dec_btn, 'Ounces')
        end

        def present?
          mail_pounds.present? && mail_ounces.present?
        end
      end

      class PrintFormMailFrom < Browser::StampsHtmlField
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

        def select(str)
          drop_down.safe_click

          if str.downcase == 'default'
            element = browser.li(css: "div[class*=floating]>div>ul>li[class*=selected]")
          elsif str.downcase.include? "manage shipping"
            element = browser.li(text: "Manage Mailing Addresses...")
          else
            element = browser.div(text: "#{str}")
          end

          selection = StampsElement.new(element)

          if str.downcase.include? "manage shipping"
            10.times do
              begin
                drop_down.safe_click unless selection.present?
                selection.scroll_into_view
                selection.safe_click
                return manage_shipping_address if manage_shipping_address.present?
              rescue
                #ignore
              end
            end
          else
            10.times do
              drop_down.safe_click unless selection.present?
              selection.scroll_into_view
              selection_text = selection.safe_text
              selection.safe_click
              text_val = text_box.text
              begin
                break if text_val.include? selection_text
              end unless selection_text.nil? || text_val.nil?
            end
          end
        end
      end

      class PrintFormService < Browser::StampsHtmlField
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
          10.times do
            begin
              break if (text_box.safe_text).include? str
              drop_down.safe_click unless selection.present?
              selection.scroll_into_view
              selection.safe_click
            rescue
              #ignore
            end
          end
          expect(text_box.safe_text).to include(str)
          logger.info "#{text_box.safe_text} service selected."
          selection
        end

        def cost(selection)
          cost_label = StampsElement.new browser.td css: "tr[data-qtip*='#{selection}']>td:nth-child(3)"
          10.times {
            begin
              drop_down.safe_click unless cost_label.present?
              if cost_label.present?
                service_cost = ParameterHelper.remove_dollar_sign(cost_label.text).to_f.round(2)
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
          5.times {
            begin
              button.safe_click unless selection_label.present?
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

      class StampAmount < Browser::StampsHtmlField
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
            button.safe_click
          end
        end

        def decrement value
          button = StampsElement.new browser.div css: "div[id^=fieldcontainer-][id$=-innerCt]>div[id^=fieldcontainer-][id$=-targetEl]>table[id^=numberfield]>tbody>tr>td>table>tbody>tr>td>div[class*=down]"
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class PrintFormEmail < Browser::StampsHtmlField
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

      class MailTracking < Browser::StampsHtmlField

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
              button.safe_click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
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

      class PrintFormInsureFor < Browser::StampsHtmlField
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

      class PrintFormCostCode < Browser::StampsHtmlField
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
              button.safe_click #unless selection_label.present?
              selection_label.scroll_into_view
              selection_label.safe_click
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

      class PrintFormQuantity < Browser::StampsHtmlField
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
            button.safe_click
          end
        end

        def decrement value
          button = StampsElement.new(browser.divs(css: "div[class*=x-form-spinner-down]")[7])
          value.to_i.times do
            button.safe_click
          end
        end
      end

      class PrintFormMailToLink < Browser::StampsHtmlField
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
            link.safe_click
          end
          expect(contacts_modal.present?).to be(true)
        end
      end

      class PrintFormMailTo < Browser::StampsHtmlField
        attr_reader :domestic, :international, :mail_to_link
        include PrintFormBlurOut

        def initialize(param)
          super(param)
          @domestic = MailToDom.new(param)
          @international = MailToInt.new(param)
          @mail_to_link = PrintFormMailToLink.new(param)
        end
      end

      class PrintFormCustoms < Browser::StampsHtmlField
        attr_reader :button, :customs_form

        def initialize(param)
          super(param)
          @button = StampsElement.new(browser.span(id: "sdc-mainpanel-editcustombtn-btnInnerEl"))
          @customs_form = CustomsForm::MailCustomsForm.new(param)
        end

        def edit_form
          15.times do
            button.safe_click
            sleep(0.35)
            return customs_form if customs_form.present?
          end
          expect(customs_form.present?).to be true
        end

        def restrictions

        end

        def i_agree_to_insurance_terms
        end
      end
    end
  end
end