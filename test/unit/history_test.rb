require 'test_helper'

class HistoryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert History.new.valid?
  end
end
