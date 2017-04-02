# C4URSELF Project

## Instructions (Linux environment)

* Clone this project on a linux machine
* Execute the run.sh and see the magic happens.

## Instructions (Any other environment)
* Make sure that you have installed ruby 2.3
* Make sure that you have in your PATH variable environment the path to chromedriver or phantomjs
* On the docker/testsuite/automated directory execute the command `bundle install`
* From the automated directory execute the command `bundle exec cucumber features/<feature> BROWSER=<chrome or phantom>`

## Additional Information
This test project is using Ruby, Cucumber, Capybara, PhantomJS and PageObjects patterns.
  To help on PageObjects patterns this project is using site_prism
  For the Linux environment this project is also using Ansible and Docker. The script set up a whole functional environment with Jenkins installed and configured.
  The test build is ready to be executed at Jenkins

  If you need any further information, feel free to contact me.
