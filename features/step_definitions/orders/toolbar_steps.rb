

Then /^[Cc]lick [Oo]rders [Tt]oolbar [Ss]ettings [Bb]utton$/ do
  stamps.orders.orders_toolbar.orders_settings.click
end

Then /^[Ii]n Orders Toolbar, Refresh Orders$/ do
  stamps.orders.orders_toolbar.refresh_orders
end

#todo-Rob Revisit Reprinting tests, make it part of Printing tests
Then /^[Ii]n Print modal, Open Reprint Modal$/ do
  @reprint_modal = stamps.orders.orders_toolbar.reprint
end

Then /^Label Unavailable: Expect Visible$/ do
  case @reprint_modal
    when LabelUnavailable
      SdcLogger.step @reprint_modal.message
      label_unavailable_visible = @reprint_modal.present?
      #StampsTest.log.step "Test #{(label_unavailable_visible)?"Passed":"Failed"}"
      @reprint_modal.ok
      @reprint_modal.close
      expect(label_unavailable_visible).to be(true)
    else
      #SdcLog.step "Test #{(@reprint_modal.present?)?"Passed":"Failed"}"
      expect(@reprint_modal).to be_present
  end
end

Then /^[Ss]elect [Gg]rid [Tt]oolbar [Mm]ore [Aa]ctions item ([Ss]plit [Oo]rder|[Aa]pply [Bb]ulk [Aa]ction|[Cc]ombine [Oo]rders)$/ do |str|
  case str.downcase
    when /combine orders/
      #stamps.orders.orders_toolbar.toolbar_more_actions.select_combine_orders
    when /split order/
      expect(stamps.orders.orders_toolbar.toolbar_more_actions.select_split_order).to match(/Split Order #(?:\d)+/)
    when /apply bulk action/
      #stamps.orders.orders_toolbar.toolbar_more_actions.select_apply_bulk_action
    else
      # ignore
  end
end

