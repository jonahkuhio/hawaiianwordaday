class WordsController < ApplicationController
  before_filter :require_user, :only => [:new, :create]

  def index
    @words = Word.find(:all)
  end
  
  def show
    @word = Word.find(params[:id])
  end
 
  def new
    @word = Word.new
    @categories = Category.find(:all)
  end
  
  def create
    @categories = Category.find(:all)
    @word = Word.new(params[:word])
    @word.user = session[:user]
    @word.email = session[:user].email
    if @word.save
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @classified = Classified.find(params[:id])
    @categories = Category.find(:all)
  end
  
  def update
    @classified = Classified.find(params[:id])
     @categories = Category.find(:all)
    if @classified.update_attributes(params[:classified])
      redirect_to classified_path(@classified)
    else
      render :action => 'edit'
    end
  end
  
  def search
    @classifieds = Classified.find(:all, :conditions => ["lower(title) like ?", "%" + params[:search].downcase + "%"])
    if params['search'].to_s.size < 1
      render :nothing => true
    else
      if @classifieds.size > 0
        render :partial => 'classified', :collection => @classifieds
      else
        render :text => "<li>No results found</li>", :layout => false
      end
    end
  end
  
  def destroy
    Classified.find(params[:id]).destroy
    redirect_to root_path
  end
  
  def contact
    @classified = Classified.find(params[:id])
    ClassifiedMailer.deliver_contact(@classified,params[:contact])
    return if request.xhr?
    render :nothing => true
  end
  
  def image
    @image = Classified.find(params[:id])
    send_data @image.picture, :filename => "photo.jpg", :type => @image.content_type, :disposition => "inline"
  end
  
  def email
    @classified = Classified.find(params[:id])
    url = "#{request.env["SERVER_NAME"]}/classified/#{@classified.id}"
    if request.post?
      ClassifiedMailer.deliver_classified_with_attachment(params[:user][:email], @classified, url)
    end
  end
end
