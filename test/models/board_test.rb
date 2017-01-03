require 'test_helper'

#  tests for the business logic of boards
class BoardTest < ActiveSupport::TestCase
  setup do
    @board = boards(:one)
    @card = cards(:one)
  end

  test 'my boards has just this one card' do
    assert_equal 1, @board.cards.length
  end

  test 'last_change is depends on card modification' do
    ActiveRecord::Base.record_timestamps = false
    @board.updated_at = '2017-01-01 12:00:00'
    @board.save!
    @card.updated_at = '2017-01-01 13:00:00'
    @card.save!
    ActiveRecord::Base.record_timestamps = true

    assert_equal @card.updated_at, @board.last_change
  end

  test 'last_change is depends on board' do
    ActiveRecord::Base.record_timestamps = false
    @board.updated_at = '2017-01-01 14:00:00'
    @board.save!
    @card.updated_at = '2017-01-01 13:00:00'
    @card.save!
    ActiveRecord::Base.record_timestamps = true

    assert_equal @board.updated_at, @board.last_change
  end
end
