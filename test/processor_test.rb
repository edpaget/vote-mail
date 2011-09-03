require './processor.rb'
require 'test/unit'

class ProcessorTest < Test::Unit::TestCase

  def setup
    @arg_hash = {:post => "http://www.google.com",
                :sender => "sender@example.com"}
  end

  def teardown
    File.delete("Post/#{Digest::MD5.hexdigest(@arg_hash[:post])}.yml")
  end

  def test_new_post
    post(@arg_hash)
    test_post = Post.load(@arg_hash[:post])
    puts test_post.class
    assert_equal test_post.post, "http://www.google.com"
  end

  def test_up_post
    post(@arg_hash)
    post(@arg_hash)
    test_post = Post.load(@arg_hash[:post])
    assert_equal test_post.upvotes, 1
  end

  def test_upvote
    post(@arg_hash)
    test_post = Post.load(@arg_hash[:post])
    test_post.up!
    assert_equal test_post.upvotes, 1
  end

  def test_downvote
    post(@arg_hash)
    test_post = Post.load(@arg_hash[:post])
    test_post.down!
    assert_equal test_post.downvotes, 1
  end
end
    
