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

  def test_assembled_hash
    test_parse = MailCommand.new(@post_site)
    compare_hash = { :title => "This is a pretty cool site", :url => "http://www.google.com" }
    assert_equal compare_hash, test_parse.args
  end

  def test_read_body
    test_body = @post_site.body.decoded
    test_object = MailCommand.new(@post_site)
    assert_equal ['POST', 'TITLE', 'This is a pretty cool site', 'URL', 'http://www.google.com'], test_object.read_body(test_body) 
  end

  def test_valid_arg?
    test_object = MailCommand.new(@post_site)
    assert test_object.valid_arg?('URL')
    
  end

  def test_parse_args
    test_object = MailCommand.new(@post_site)
    test_arg_hash = test_object.parse_args(['TITLE', 'Test', 'URL', 'www.a.com'])
    assert_equal 'Test', test_arg_hash[:title]
  end
    

end
