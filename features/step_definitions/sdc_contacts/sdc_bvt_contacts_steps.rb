Then /^[Ee]xpect [Cc]ontacts [Dd]elete [Mm]essage [Bb]ox [Ii]s [Aa]vailable$/ do
  message_box = SdcContacts.contacts_delete_message_box
  message_box.title.safe_wait_until_present(timeout: 10)
end

Then /^temp$/ do
  us_states = data_for(:us_states, {})
  states = us_states.values
  p 'states'
  p states
  state_abbr = us_states.keys
  p 'state_abbr'
  p state_abbr
  state0 = us_states['OH']
  p 'state0'
  p state0
  state1=us_states.key['Ohio']
  p 'state1'
  p state1
  state2 = states["OH"]
  state3=state_abbr["Ohio"]
  p state
  p state1
  p state2
  p state3

end