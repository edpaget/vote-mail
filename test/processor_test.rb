require './processor.rb'
require 'test/unit'

class ProcessorTest < Test::Unit::TestCase
  include Processor

  def setup
    @arg_hash = {:post => "http://www.google.com",
                :poster => "sender@example.com"}
  end

  def teardown
    File.delete("Post/#{Digest::MD5.hexdigest(@arg_hash[:post])}.yml")
  end

  def test_new_post
    post(@arg_hash)
    test_post = Post.load(@arg_hash[:post])
    assert_equal "http://www.google.com", test_post.post 
  end

  def test_up_post
    post(@arg_hash)
    post(@arg_hash)
    test_post = Post.load(@arg_hash[:post])
    assert_equal 1, test_post.upvotes
  end

  def test_upvote
    post(@arg_hash)
    assert_equal 1, upvote(@arg_hash[:post])
  end

  def test_downvote
    post(@arg_hash)
    assert_equal 1, downvote(@arg_hash[:post])
  end
end
    
