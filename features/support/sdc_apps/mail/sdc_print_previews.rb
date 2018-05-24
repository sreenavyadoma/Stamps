module SdcMail

  module SdcPrintPreview

    class CostCode < SdcPage
      page_object(:text_field, tag: :text_field) { { xpath: '//*[@name="CostCode"]' } }
      page_object(:drop_down) { { xpath: '//*[contains(@id,"costcodesdroplist-")][contains(@id,"trigger-picker")]' } }

      def selection(name, str)
        page_object(name) { { xpath: "//li[text()='#{str}']" } }
      end
    end

    class PrintPreview < SdcPage
      page_object(:reference_no) { { xpath: '//*[contains(@id,"printPreviewPanel-")][@class="x-autocontainer-innerCt"]//input[@role="textbox"]' } }

      def cost_code
        CostCode.new
      end
    end

    class Stamps < PrintPreview

      def starting_label
      end

    end

    class ShippingLabels < PrintPreview

      page_object(:hide_chooser) { { xpath: '' } }
      page_object(:hide_verify) { { xpath: '' } }
      chooser(:hide_label_value, :hide_chooser, :hide_verify,
              :class, :selected)

      page_object(:receipt_chooser) { { xpath: '' } }
      page_object(:receipt_verify) { { xpath: '' } }
      chooser(:print_receipt, :receipt_chooser, :receipt_verify,
              :class, :selected)

      page_object(:ref_chooser) { { xpath: '' } }
      page_object(:ref_verify) { { xpath: '' } }
      chooser(:print_reference_number, :ref_chooser, :ref_verify,
              :class, :selected)


      def starting_label
      end

    end

    class Envelopes < PrintPreview

      page_object(:ret_chooser) { { xpath: '' } }
      page_object(:ret_verify) { { xpath: '' } }
      chooser(:return_address, :del_chooser, :ret_verify,
              :class, :selected)

      page_object(:del_chooser) { { xpath: '' } }
      page_object(:del_verify) { { xpath: '' } }
      chooser(:delivery_address, :ret_chooser, :ret_verify,
              :class, :selected)

      page_object(:pos_chooser) { { xpath: '' } }
      page_object(:pos_verify) { { xpath: '' } }
      chooser(:postage, :pos_chooser, :pos_verify,
              :class, :selected)


      def preview
      end

    end

    class CertifiedMail < PrintPreview
      def preview
      end
    end

    class Rolls < PrintPreview

      page_object(:hide_chooser) { { xpath: '' } }
      page_object(:hide_verify) { { xpath: '' } }
      chooser(:hide_label_value, :hide_chooser, :hide_verify,
              :class, :selected)

      page_object(:ref_chooser) { { xpath: '' } }
      page_object(:ref_verify) { { xpath: '' } }
      chooser(:print_reference_number, :ref_chooser, :ref_verify,
              :class, :selected)


      def preview
      end

    end

  end

end