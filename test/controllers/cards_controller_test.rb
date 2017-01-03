require 'test_helper'

# Tests for cards controller
class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
    @card = cards(:one)
  end

  test 'should get index' do
    get board_cards_url(@board)
    assert_response :success
  end

  test 'should get new' do
    get new_board_card_url(@board)
    assert_response :success
  end

  test 'should create card' do
    assert_difference('Card.count') do
      post board_cards_url(@board), params: { card: { status: @card.status, title: @card.title } }
    end

    assert_redirected_to board_url(Card.last.board)
  end

  test 'should show card' do
    get board_card_url(@card.board, @card)
    assert_response :success
  end

  test 'should get edit' do
    get edit_board_card_url(@card.board, @card)
    assert_response :success
  end

  test 'should update card' do
    patch board_card_url(@card.board, @card), params: { card: { status: @card.status, title: @card.title } }
    assert_redirected_to board_url(@card.board)
  end

  test 'should destroy card' do
    assert_difference('Card.count', -1) do
      delete board_card_url(@card.board, @card)
    end

    assert_redirected_to board_cards_url(@board)
  end
end
