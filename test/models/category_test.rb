require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "Programmer", category_query: "'Java' OR 'C++'")
  end

  test "should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = "     "
    assert_not @category.valid?
  end

  test "name should not be too long" do
   @category.name = "a" * 31
   assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "a"
    assert_not @category.valid?
  end

  test "name should be unique" do
    duplicate_category = @category.dup
    @category.save
    assert_not duplicate_category.valid?
  end

end
