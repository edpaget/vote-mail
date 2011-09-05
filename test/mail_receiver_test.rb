require './mail_receiver'
require 'test/unit'

class MailReceiverTest < Test::Unit::TestCase

  def setup
    @post_site = Mail.new do
      from 'sender@example.com'
      to 'receiver@example.com'
      subject 'Anything can go here!'
      body "POST TITLE \"This is a pretty cool site\" URL http://www.google.com"
    end

    @post_self = Mail.new do
      from 'sender@example.com'
      to 'receiver@example.com'
      subject 'Whatever guys this really doesn\'t matter.'
      body "POST TITLE \"Woah let's look at this coool post\" SELF \"I can type stuff here!\""
    end

    @upvote = Mail.new do
      from 'sender@example.com'
      to 'receiver@example.com'
      subject 'Anything can go here!'
      body "UPVOTE POST http://www.google.com"
    end

    @downvote = Mail.new do
      from 'sender@example.com'
      to 'receiver@example.com'
      subject 'May I make offer to see you drugs?'
      body "DOWNVOTE POST http://www.google.com"
    end
  end

  def test_receive
    [@post_site, @post_self, @upvote, @downvote].each do |m|
    end
  end
  
  def test_assembled_hash
    test_hash = MailParse.build(@post_site)
    assert_equals test_hash, {:post => "This is a pretty cool site",
                              :poster => "sender@example.com",
                              :url => "http://www.google.com"}
  end
end
