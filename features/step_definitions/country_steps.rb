Given /the country page/ do
	    FactoryGirl.create(:country)
        FactoryGirl.create(:currency)
end

Then(/^the Sign in form should be shown again$/) do
	 get "users/sign_in"  
end



Then(/^I should see $/) do |text|
  page.should have_content text
end



Then /^I should see the  table:$/ do |expected_table|
  document = Nokogiri::HTML(page.body)
  rows = document.css('section>table>tr').collect { |row| row.xpath('.//th|td').collect {|cell| cell.text } }

  expected_table.diff!(rows)
end
