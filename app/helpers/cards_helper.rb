# Helpers used in (mostly) card views
module CardsHelper
  ## redefined simple url helpers for nested cards
  def card_path(c)
    board_card_path(c.board, c)
  end

  def edit_card_path(c)
    edit_board_card_path(c.board, c)
  end

  def new_card_path(b)
    new_board_card_path(b)
  end

  def cards_path(b)
    board_cards_path(b)
  end

  def status_options(selected_status)
    options_for_select(Card.valid_status.map { |x| [x, x] }, selected_status)
  end

  def status_color(s)
    {
      'backlog' => 'bg-info',
      'todo' => 'bg-warning',
      'working_on' => 'bg-danger',
      'done' => 'bg-success'
    }[s]
  end
end
