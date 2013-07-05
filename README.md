# ActionMailerStop

Sometimes, you want to simply abort the sending of an email, but at the last moment.
With this gem, simply call ``stop!`` from anything inside an action mailer method, and relax.

## Installation

Add this line to your application's Gemfile:

    gem 'action_mailer_stop'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install action_mailer_stop

## Usage

Given the following code :

    def my_helper_method(params)
      # Do stuff
    end
    
    class MyMailer < ActionMailer::Base
      def some_email
        my_helper_methods(some_params)
        mail :to => ...
      end
    end
      
Let's say you would like to stop the sending of the email in my_helper_method if the params are bad.

### Step 1

    def my_helper_method(params)
      stop! if params.bad?
      # Do stuff
    end
    
### Step 2

There is no step2.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
