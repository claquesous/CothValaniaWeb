class HomeController < ApplicationController
  def index
    @news = News.last
    @newscount = News.count
  end
end
