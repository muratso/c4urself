class HomePage < SitePrism::Page
  set_url "https://www.thinkific.com/"

  element :company_logo, "img[class='logo__image']"

  #----GET STARTED BUTTON--------
  element :menu_get_started, "a[class='btn btn-sm btn-highlight header-cta']"
  element :footer_get_started, "a[class='btn btn-sm btn-highlight footer-nav__cta']"
  element :body_get_started, "button[type='submit']"
  #----END GET STARTED BUTTON----

  element :menu, "nav[id='sm-menu']"
  element :footer, "ul[class='footer-nav']"

  element :input_email, "input[type='email']"

  def click_get_started
    #----CHOOSE A RANDOM GET STARTED BUTTON------------
    arr = [self.menu_get_started, self.footer_get_started, self.body_get_started]
    i = rand(0..2)

    #Fill the email if needed
    if (i==2)
      random_email = (5...10).map { ('a'..'z').to_a[rand(26)] }.join+"@gmail.com"
      self.input_email.set random_email
      arr[i].click
    else
      arr[i].click
    end
    #----END CHOOSE A RANDOM GET STARTED BUTTON--------
  end

end
