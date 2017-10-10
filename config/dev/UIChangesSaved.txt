
Feature: Remember Column Changes Between Sessions (Re-order, Resize, Show/Hide). Prevent Hiding Ship Cost Column [B-01705]

	Background:
			I am signed in as a Batch user
			
	Scenario: Resize  a column executed on same machine
		* Find a column you want to resize
		* Resize the column by hovering over header border then click and drag to increase or decrease size
		* Sign out
		* Sign back in on same machine
		* Go back to column you resized
		* Expect column size to be saved as what you resized
		
	Scenario: Resize a column executed on separate machines
		* Find a column you want to resize
		* Resize the column by hovering over header border then click and drag to increase or decrease size
		* Sign out
		* Sign back in on a separate machine
		* Go back to column you resized
		* Expect column size to be saved as what you resized
	
	Scenario: Re-order  a column executed on same machine
		* Find a column you want to rearrange
		* Re-order a column by clicking-and-dragging to desired place
		* Sign out
		* Sign back in on same machine
		* Go back to column you rearranged
		* Expect column to be where you moved
		
	Scenario: Re-order a column executed on separate machines
		* Find a column you want to rearrange
		* Re-order the column by clicking-and-dragging to desired place
		* Sign out
		* Sign back in on a separate machine
		* Go back to column you rearrange
		* Expect column to be where you moved 
		
	Scenario: Hide a column executed on same machine
		* Find a column you want to hide
		* Click on menu arrow to view list of hide-able columns
		* Hide the column by un-checking box
		* Sign out
		* Sign back in on same machine
		* Expect column to continue to be hidden
	
	Scenario: Hide a column executed on separate machines
		* Find a column you want to hide
		* Click on menu arrow to view list of hide-able columns
		* Hide the column by un-checking box
		* Sign out
		* Sign back in on separate machine
		* Expect column to continue to be hidden
		
	Scenario: Show a column executed on same machine
		* Find a column you want to un-hide
		* Click on menu arrow to view list of columns
		* Show the column by checking box
		* Sign out
		* Sign back in on same machine
		* Expect column to be visible
		
	Scenario: Show a column executed on separate machines
		* Find a column you want to un-hide
		* Click on menu arrow to view list of columns
		* Show the column by checking box
		* Sign out
		* Sign back in on a separate machine
		* Expect column to be visible
		
	Scenario: User Cannot Hide "Ship Cost" Column
		* Go to any column and click on menu arrow to view list of columns
		* Expect "Ship Cost" Column to not be on list 
		
	Scenario: Login with different users and each users setting saved
		* Sign in with user A
		* Make changes to columns
		* Sign out
		* Sign in with user B on same browser
		* Make changes to columns
		* Sign out
		* Sign in with user A on same browser
		* Expect all changes done before to still be there
		* Sign in with user B on same browser
		* Expect all changes done before to still be there
		
		