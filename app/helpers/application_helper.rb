# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title
    @base_title = "Referee Management Site"
    if @title.nil?
      @base_title
    else
      "#{@base_title} | #{@title}"
    end
  end
  def trim_by_words(string,wordcount)
    if string then
      string.split[0..(wordcount-1)].join(" ") +(string.split.size > wordcount ? "..." : "")
    end
  end
end
