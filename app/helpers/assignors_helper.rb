module AssignorsHelper
  def pretty_game(game)
    if game.nil? then
      "Error, Nil Game!"
    else
      "#{game.home} vs #{game.away} at " + pretty_time(game.gametime) + " on #{game.field.name}"
    end
  end
end
