require './yaml_map'
require 'test/unit'

class TestClass < YAML_map
  key :title
  fields :test, :second_test
end

class YAMLTest < Test::Unit::TestCase
  def setup
    @test_instance = TestClass.new(:title => "test",
                                   :test => 1,
                                   :second_test => "extreme")
  end

  def teardown
    File.delete("TestClass/#{Digest::MD5.hexdigest(@test_instance.title)}.yml")
  end

  def test_save!
    assert @test_instance.save!
  end

  def test_load
    @test_instance.save!
    test_load_instance = TestClass.load(@test_instance.title)
    assert_equal test_load_instance.title, "test"
  end
end
