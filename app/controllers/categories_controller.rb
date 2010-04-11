class CategoriesController < ApplicationController
  before_filter :logged_in?, :except => [:show]
  
  def index
    @categories = Category.find(:all)
  end
  
  def show
      @category = Category.find(params[:id])
  end
  
  def new
    @category = Category.new(params[:category])
    if @category.save
      return if request.xhr?
      render :partial => 'category', :object => @category
    end
  end
  
  def delete
    @category = Category.find(params[:id])
    @category.destroy
    return if request.xhr?
    render :nothing, :status => 200
  end
  protected
  def logged_in?
    unless session[:user]
      redirect_to classifieds_path
    else
      return true
    end
  end
      end
