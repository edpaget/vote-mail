require './yaml_map'
require './models/posts'
require 'test/unit'

class PostTest < Test::Unit::TestCase

  def setup
    @test_instance = Post.new(:post => "http://www.google.com",
                              :upvotes => 0,
                              :downvotes => 0)
  end

  def test_create_instance
    assert @test_instance
  end
end
