require 'spec_helper'
require 'action_mailer'
require 'action_mailer_stop'

class DummyMailer < ActionMailer::Base
  def foo(stop)
    stop! if stop
    mail :from => 'me@me.com', :to => 'test@example.org', :subject => 'whatever' do |format|
      format.html { render :text => 'foo'}
      format.text { render :text => 'bar'}
    end
  end
end

describe 'ActionMailer::Stop' do

  before :all do
    ActionMailer::Base.delivery_method = :test
  end

  it 'Stops the sending of the mail' do
    m = DummyMailer.foo(true)
    m.deliver
    ActionMailer::Base.deliveries.should be_empty
  end

  it 'Delivers the email if stop! has not been called' do
    m = DummyMailer.foo(false)
    m.deliver
    ActionMailer::Base.deliveries.should == [m]
  end

end
