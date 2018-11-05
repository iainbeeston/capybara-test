require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'Headless', type: :system do
  context 'when js driver is set' do
    around do |example|
      Capybara.javascript_driver = :selenium_chrome_headless
      example.run
      Capybara.javascript_driver = :selenium
    end

    it 'runs the spec headlessly', js: true do
      visit 'pages/home'
      expect(Capybara.current_driver).to eq(:selenium_chrome_headless)
    end
  end

  context 'when driven_by is set' do
    before do
      driven_by :selenium_chrome_headless
    end

    it 'runs the spec headlessly' do
      visit 'pages/home'
      expect(Capybara.current_driver).to eq(:selenium_chrome_headless)
    end
  end
end
