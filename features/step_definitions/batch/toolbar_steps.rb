When /^Add a new order$/ do
  log_step "Add a new order"
  log "When I Add a new order..."
  batch.tool_var.add
  log "When I Add a new order... done."
  batch.grid.edit_order Batch.order_id
  #end_step step
end