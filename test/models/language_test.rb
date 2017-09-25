require 'test_helper'

class LanguageTest < ActiveSupport::TestCase

  def setup
    @language = Language.new(name: "French")
  end

  test "should be valid" do
    assert @language.valid?
  end

  test "name should be present" do
    @language.name = "     "
    assert_not @language.valid?
  end

  test "name should not be too long" do
   @language.name = "a" * 31
   assert_not @language.valid?
  end

  test "name should not be too short" do
    @language.name = "a"
    assert_not @language.valid?
  end

  test "name should be unique" do
    duplicate_language = @language.dup
    @language.save
    assert_not duplicate_language.valid?
  end

end
