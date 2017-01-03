require 'test_helper'

class CardTest < ActiveSupport::TestCase
  setup do
    @card = cards(:one)
  end

  test 'prev_status of first status is nil' do
    @card.status = Card.valid_status.first
    @card.save!
    assert_nil @card.prev_status
  end

  test 'next_status of first status is second status' do
    @card.status = Card.valid_status.first
    @card.save!
    assert_equal Card.valid_status[1], @card.next_status
  end

  test 'prev_status of last status is last but one status' do
    @card.status = Card.valid_status.last
    @card.save!
    assert_equal Card.valid_status[-2], @card.prev_status
  end

  test 'next_status of last status is nil' do
    @card.status = Card.valid_status.last
    @card.save!
    assert_nil @card.next_status
  end
end
