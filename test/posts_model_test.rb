require './yaml_map'
require './models/posts'
require 'test/unit'

class PostTest < Test::Unit::TestCase

  def setup
    @test_instance = Post.new(:post => "http://www.google.com",
                              :poster => "ed.paget@gmail.com",
                              :upvotes => 0,
                              :downvotes => 0)
  end

  def test_create_instance
    assert @test_instance
  end

  def test_upvote
    @test_instance.up!
    puts @test_instance.upvotes
    assert_equal 1, @test_instance.upvotes
  end

  def test_downvote
    @test_instance.down!
    assert_equal 1, @test_instance.downvotes
  end
    
end
