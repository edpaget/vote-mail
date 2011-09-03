require './mail_receiver'
require 'test/unit'

class MailReceiverTest < Test::Unit::TestCase

  def setup
    @post_site = Mail.new do
      from 'sender@example.com'
      to 'receiver@example.com'
      subject 'http:://www.google.com'
      body "POST TITLE \"This is a pretty cool site\""
    end

    @post_self = Mail.new do
      from 'sender@example.com'
      to 'receiver@example.com'
      subject 'SELF'
      body "POST TITLE \"Woah let's look at this coool post\" \n POST BODY \"I can type stuff here!\""
    end

    @upvote = Mail.new do
      from 'sender@example.com'
      to 'receiver@example.com'
      subject 're:http://www.google.com'
      body "UPVOTE"
    end

    @downvote = Mail.new do
      from 'sender@example.com'
      to 'receiver@example.com'
      subject 're:http:://www.google.com'
      body "DOWNVOTE"
    end
  end

  def test_receive
    [@post_site, @post_self, @upvote, @downvote].each do |m|
    end
  end
end
