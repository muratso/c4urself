require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'rspec/expectations'
require 'settingslogic'
require 'pry'
require 'phantomjs'
require 'httparty'
require 'site_prism'
require_relative 'pages/all_page_objects'


# Capybara.configure do |config|
#   config.default_driver = :poltergeist
#   config.javascript_driver = :poltergeist
#   config.run_server = false
#   config.default_selector = :css
#   config.default_max_wait_time = 10
#
#   # capybara 2.1 config options
#   config.match = :prefer_exact
#   config.ignore_hidden_elements = false
# end

$BROWSER = ENV['BROWSER']

if $BROWSER == "chrome"
  puts "Executing tests on Chrome"
  puts "----------------------------"
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    options = {
        :js_errors => false,
        :timeout => 360,
        :debug => false,
        :inspector => false,
    }
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end

  Capybara.javascript_driver = :chrome
else
  $BROWSER = "phantomjs"
  puts "Executing tests on Phantomjs"
  puts "----------------------------"
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
        app,
        :phantomjs => Phantomjs.path,
        inspector: true,
        js_errors: false,
        window_size: [1280, 1024],
        phantomjs_options: ['--ignore-ssl-errors=yes','--ssl-protocol=tlsv1'],
        debug: false
    )
  end
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
  Capybara.ignore_hidden_elements = false
  Capybara.default_selector = :css
  HTTParty::Basement.default_options.update(verify: false)
end

SitePrism.configure do |config|
  config.use_implicit_waits = true
end

