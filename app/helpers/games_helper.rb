module GamesHelper
  def prettytime(time)
    time.strftime("%D at %I:%M%p")
  end
end
