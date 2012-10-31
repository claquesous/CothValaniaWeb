class HomeController < ApplicationController
#  before_filter(:except => :index) { |a| a.send(:authorize,:admin) }
  def index
    @news = News.last
    @newscount = News.count
  end
end
