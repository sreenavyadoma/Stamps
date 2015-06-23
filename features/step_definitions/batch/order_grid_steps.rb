When /^Edit row (\d+) in the order grid$/ do |row|
  log "Edit row \"#{row}\" in the order grid"
  batch.grid.check_row row
  #end_step step
end