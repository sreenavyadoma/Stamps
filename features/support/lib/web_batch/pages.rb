module Batch

  class LoginPage < BatchPage
    private
    LOGIN_FIELDS ||= {
        :sign_in_link_loc => {:text => 'Sign In'},
        :username_loc => {:id => 'UserNameTextBox'},
        :password_loc => {:id => 'PasswordTextBox'},
        :sign_in_button_loc => {:id => 'signInButton'}
    }

    public
    def page_title
      @browser.title
    end

    def verify_page
      page_title
    end

    def username_textbox
      @browser.text_field(LOGIN_FIELDS[:username_loc])
    end

    def password_textbox
      @browser.text_field(LOGIN_FIELDS[:password_loc])
    end

    def sign_in_btn
      @browser.button(LOGIN_FIELDS[:sign_in_button_loc])
    end


    def visit
      @browser.goto url = "http://#{Batch.url_prefix}.stamps.com/webbatch/"
      log "Visited #{url}"
      self
    end

    def sign_in(*args)
      grid = Grid.new @browser
      navigation = self.navigation_bar
      welcome_modal = WelcomeModal.new @browser
      welcome_orders_page = WelcomeOrdersPage.new @browser
      plugin_issue = ErrorStampsPluginIssue.new @browser

      toolbar = self.toolbar
      case args.count
        when 0
          # user default sign in credentials
          # credentials = batch_helper.rand_login_credentials
          username = log_param "username", ENV["USR"] #credentials["username"]
          password = log_param "password", ENV["PW"] #credentials["password"]
        when 1
          if args[0].is_a? Hash
            username = args[0]['username']
            password = args[0]['password']
          else
            raise 'Argument Parameter Error.'
          end
        when 2
          username = args[0]
          password = args[1]
        else
          raise 'Argument Parameter Error.'
      end

      20.times do
        visit
        begin
          if username_textbox.present?
            username_textbox.wait_until_present
            self.username = username
            self.password = password
            browser_helper.click sign_in_btn, "SignIn"
            sign_in_btn.wait_while_present(5)
            toolbar.wait_until_present

            sleep(1)

            if welcome_modal.present?
              welcome_modal.ok
              break
            end

            if welcome_orders_page.present?
              welcome_orders_page.continue
              break
            end

            if plugin_issue.present?
              plugin_issue.close
              break
            end
          end

          break if toolbar.present? || grid.present?

          begin
            navigation.orders
          rescue
            #ignroe
          end

          grid.wait_until_present 40
          break if toolbar.present? || grid.present?
          visit
        rescue
          #ignore
        end
      end

      if plugin_issue.present?
        raise "Stamps.com Plugin Issue"
      end

    end

    def username=(username)
      browser_helper.set username_textbox, username, 'Username'
    end

    def password=(password)
      browser_helper.set password_textbox, password, 'Password'
    end

    def sign_in_button
      sign_in_btn.click
    end
  end


  class WebBatch < BatchPage
    def sign_in(*args)
      LoginPage.new(@browser).sign_in *args
    end

    def awaiting_shipment
      #todo-elie here are your steps;
      # 1. Click Awaiting shipment tab
      # 2.  give back an instance of Grid.

      Grid.new @browser
    end

    def shipped
      #todo-elie here are your steps;
      # 1. Click Awaiting shipment tab
      # 2.  give back an instance of Grid.

      Grid.new @browser

    end

    def filters_panel
      Filters.new(@browser)
    end

    def multi_order
      MultiOrder.new(@browser)
    end

    def single_order_form
      SingleOrderForm.new(@browser)
    end

    def grid
      Grid.new(@browser)
    end

    def styles
      PageStyles.new @browser
    end
  end


  class WelcomeOrdersPage < BatchObject
    private
    def continue_span
      @browser.span :text => "Continue"
    end

    public
    def present?
      browser_helper.present? continue_span
    end

    def wait_until_present
      begin
        continue_span.wait_until_present
      rescue
        #ignore
      end
    end

    def continue
      5.times{
        if browser_helper.present? continue_span
          browser_helper.click continue_span, 'continue'
        end
        break unless browser_helper.present? continue_span
      }
    end
  end

  class WelcomeModal < BatchObject
    private
    def okay_button
      @browser.span :text => 'OK'
    end

    public
    def present?
      browser_helper.present? okay_button
    end

    def wait_until_present
      begin
        okay_button.wait_until_present
      rescue
        #ignore
      end
    end

    def ok
      5.times{
        browser_helper.click okay_button, 'OK'
        break unless browser_helper.present? okay_button
      }
    end
  end

end