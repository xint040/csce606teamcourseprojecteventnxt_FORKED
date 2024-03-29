Given("I am on the Email service page") do
  visit email_services_path
  # You may need to adjust the path if your email service page has a different URL
end

When("I click on {string} button") do |button_text|
  click_on button_text
end
