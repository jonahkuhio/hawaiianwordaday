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
    @word = Word.find(params[:id])
    @categories = Category.find(:all)
  end
  
  def update
    @word = Word.find(params[:id])
     @categories = Category.find(:all)
    if @word.update_attributes(params[:word])
      redirect_to word_path(@word)
    else
      render :action => 'edit'
    end
  end
  
  def search
    @words = Word.find(:all, :conditions => ["lower(term) like ?", "%" + params[:search].downcase + "%"])
    if params['search'].to_s.size < 1
      render :nothing => true
    else
      if @words.size > 0
        render :partial => 'word', :collection => @words
      else
        render :text => "<li>No results found</li>", :layout => false
      end
    end
  end
  
  def destroy
    Word.find(params[:id]).destroy
    redirect_to root_path
  end
  
  #def contact
    #@classified = Classified.find(params[:id])
    #ClassifiedMailer.deliver_contact(@classified,params[:contact])
    #return if request.xhr?
    #render :nothing => true
  #end
  
  #def image
    #@image = Classified.find(params[:id])
    #send_data @image.picture, :filename => "photo.jpg", :type => @image.content_type, :disposition => "inline"
  #end
  
  def email
    @word = Word.find(params[:id])
    if request.post?
      ClassifiedMailer.deliver_word_from_friend(params[:user][:email], @word)
    end
  end
end
