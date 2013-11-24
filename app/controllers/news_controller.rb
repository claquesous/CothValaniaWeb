class NewsController < ApplicationController
  before_filter(only: [:destroy, :edit, :update]) { |a| a.send(:authorize,:leader) }
  before_filter(except: [:index, :show]) { |a| a.send(:authorize,:admin) }
  respond_to :html, :json

  def index
    @news = News.includes(:member).page(params[:page])
    respond_with @news
  end

  def show
    @news = News.find(params[:id])
    respond_with @news
  end

  def new
    @news = News.new
    respond_with @news
  end

  def edit
    @news = News.find(params[:id])
  end

  def create
    @news = News.new(params[:news])
    @news.member = current_member
    flash[:notice] = 'News was successfully created.' if @news.save
    respond_with @news
  end

  def update
    @news = News.find(params[:id])
    flash[:notice] = 'News was successfully updated.' if @news.update_attributes(params[:news])
    respond_with @news
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    respond_with @news
  end
end
