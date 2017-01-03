# README

This is the 'Kanban Board' example app.
See https://backend-development.github.io/rails_view_and_controller.html

## Study the Models 

This Application already has two models: boards and cards.
Create the database and load the seed data by running
`rails db:setup`

## Replace the Homepage

Redirect home to the list of kanban boards.

## Study Dependent Models 

Cards depend on their board and are deleted when the board
is deleted.  Delete a board and study the log file: how are the
cards deleted? Does Rails use referential integrity in the
database?

Answer: The Log files shows several queries to the database.
referential integrity in the database is not used

```
  Board Load (0.4ms)  SELECT  "boards".* FROM "boards" WHERE "boards"."id" = ? LIMIT ?  [["id", 2], ["LIMIT", 1]]
   (0.1ms)  begin transaction
  Card Load (0.4ms)  SELECT "cards".* FROM "cards" WHERE "cards"."board_id" = ?  [["board_id", 2]]
  SQL (0.5ms)  DELETE FROM "cards" WHERE "cards"."id" = ?  [["id", 3]]
  SQL (0.2ms)  DELETE FROM "boards" WHERE "boards"."id" = ?  [["id", 2]]
```

If the database contained a constraint like:

```
ALTER TABLE cards
  ADD CONSTRAINT boardfk 
  FOREIGN KEY(board_id) REFERENCES board(id) ON DELETE CASCADE
```

ond `DELETE` query would be enough to delete both a board and all its cards:

```
  DELETE FROM "boards" WHERE "boards"."id" = 2
```

## A Better Form

Have a look at `card.status`. I has only four possible values. 
In the form for cards replace the textfield with a dropdown list.

Answer:

to make the class-variable @@valid_status accessible we have to write
a class method:

```
  def self.valid_status
    @@valid_status
  end
```

The return value is just an array of strings, as we can see in the rails console:

```
irb(main):001:0> Card.valid_status
=> ["backlog", "todo", "working_on", "done"]
```

but the form helper for option an select expects html:

```
  <div class="field">
    <%= f.label :status %>
    <%= f.select( :status, "<option value='backlog'>backlog</option><option value='todo'>todo</option><option value='working_on'>working_on</option><option value='done'>done</option>" ) %>
  </div>
```

Now we need a piece of code that converts the array of strings into the HTML.
This code is a bit long to put it in the view itself.  But it is concerned with
the display of information, so it does not belong in the model either.
Code like that can be saved in `helpers`:

```
file app/helpers/cards_helper.rb

  def status_options
    options_for_select( Card.valid_status.map { |x| [x,x] } )
  end

file app/views/cards/_form.html.erb

  <div class="field">
    <%= f.label :status %>
    <%= f.select( :status, status_options ) %>
  </div>

```



## Nested Ressources

Study the URLs, controllers and actions by running `rails 
routes`. Now change `config/routes.rb` to 

    resources :boards do
      resources :cards
    end

How do the URLs change?

Answer:

Before the change:
```
$ rails routes
    Prefix Verb   URI Pattern                Controller#Action
     cards GET    /cards(.:format)           cards#index
           POST   /cards(.:format)           cards#create
  new_card GET    /cards/new(.:format)       cards#new
 edit_card GET    /cards/:id/edit(.:format)  cards#edit
      card GET    /cards/:id(.:format)       cards#show
           PATCH  /cards/:id(.:format)       cards#update
           PUT    /cards/:id(.:format)       cards#update
           DELETE /cards/:id(.:format)       cards#destroy
    boards GET    /boards(.:format)          boards#index
           POST   /boards(.:format)          boards#create
 new_board GET    /boards/new(.:format)      boards#new
edit_board GET    /boards/:id/edit(.:format) boards#edit
     board GET    /boards/:id(.:format)      boards#show
           PATCH  /boards/:id(.:format)      boards#update
           PUT    /boards/:id(.:format)      boards#update
           DELETE /boards/:id(.:format)      boards#destroy
      root GET    /                          boards#index
```

After the change:
```
$ rails routes
         Prefix Verb   URI Pattern                                Controller#Action
    board_cards GET    /boards/:board_id/cards(.:format)          cards#index
                POST   /boards/:board_id/cards(.:format)          cards#create
 new_board_card GET    /boards/:board_id/cards/new(.:format)      cards#new
edit_board_card GET    /boards/:board_id/cards/:id/edit(.:format) cards#edit
     board_card GET    /boards/:board_id/cards/:id(.:format)      cards#show
                PATCH  /boards/:board_id/cards/:id(.:format)      cards#update
                PUT    /boards/:board_id/cards/:id(.:format)      cards#update
                DELETE /boards/:board_id/cards/:id(.:format)      cards#destroy
         boards GET    /boards(.:format)                          boards#index
                POST   /boards(.:format)                          boards#create
      new_board GET    /boards/new(.:format)                      boards#new
     edit_board GET    /boards/:id/edit(.:format)                 boards#edit
          board GET    /boards/:id(.:format)                      boards#show
                PATCH  /boards/:id(.:format)                      boards#update
                PUT    /boards/:id(.:format)                      boards#update
                DELETE /boards/:id(.:format)                      boards#destroy
           root GET    /                                          boards#index
```

## Changes in `cards_controller` 

Change the card_controller to
always read `params[:board_id]`.  You can use
a `before_action` to do that!

The index-action should
only show cards of this board.  

When creating or updating a card
there should be no input-field for `board_id` in the form,
the `board_id` is already specified by the url.


## Display the Kanban Board 

Research what a kanban board shold look like.
Change the show-view of board to look like this.





