class HomeController < ApplicationController
  def index
    @news = News.first
    @newscount = News.count
  end
end
