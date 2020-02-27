require 'capybara/rspec'
require 'faker'

describe "Integration" do
  context 'for auth user' do
    let(:user) { create(:user) }

    it 'should save successfully' do
      user = User.new(name: 'VPG', password:'123456').save
      expect(user).to eq(true)
    end
  end
end

# require 'selenium-webdriver'
# require 'nokogiri'
# require 'capybara'

# Capybara.register_driver :selenium do |app|  
#   Capybara::Selenium::Driver.new(app, browser: :chrome)
# end
# Capybara.javascript_driver = :chrome

# Capybara.configure do |config|  
#   config.default_max_wait_time = 10 # seconds
#   config.default_driver = :selenium
# end
# # Visit
# browser = Capybara.current_session
# driver = browser.driver.browser

# browser.visit 'https://banana.by/index.php'
