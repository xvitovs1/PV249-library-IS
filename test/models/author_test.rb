require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def setup
    @author = Author.new(name: 'Test author')
  end

  test 'should be valid' do
    assert @author.valid?
  end

  test 'name should be present' do
    @author.name = '     '
    assert_not @author.valid?
  end
end
