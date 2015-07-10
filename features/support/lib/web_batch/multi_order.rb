module Batch
  class MultiOrder < BatchPage
    private
    def order_count_label
      @browser.ps(:css => 'b').last
    end

    public
    def order_count
      raise "Multi-order Count Label does not exist or Multi-order form not opened." unless browser_helper.field_present? order_count_label
      browser_helper.text(order_count_label).gsub(/\d+/).first
    end

  end
end