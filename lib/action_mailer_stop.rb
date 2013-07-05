require "action_mailer_stop/version"

module ActionMailer
  module Stop

    def self.included(base)
      base.alias_method_chain :process, :stop
    end

    class MailStoppedError < StandardError; end

    def stop!
      raise MailStoppedError
    end

    def process_with_stop(*args)
      begin
        process_without_stop *args
      rescue MailStoppedError
        self.message.perform_deliveries = false
      end
    end

  end
end

if defined? ActionMailer::Base
  ActionMailer::Base.send(:include, ActionMailer::Stop)
end
