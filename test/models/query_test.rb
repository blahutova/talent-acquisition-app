require 'test_helper'

class QueryTest < ActiveSupport::TestCase

  def setup
    @query = Query.new(name: "Something", text_of_query: "'Java' AND 'Database'", user_id: 1)
  end

  # test "should be valid" do
  #   assert @query.valid?
  # end

  test "name should be present" do
    @query.name = "     "
    assert_not @query.valid?
  end

  test "name should not be too long" do
   @query.name = "a" * 51
   assert_not @query.valid?
  end

  test "name should not be too short" do
    @query.name = "a"
    assert_not @query.valid?
  end

end
