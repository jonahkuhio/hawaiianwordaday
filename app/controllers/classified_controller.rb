class ClassifiedController < ApplicationController
  def list
    @classifieds = Classified.find(:all)
  end
  def show
    @classified = Classified.find(params[:id])
  end
 layout 'standard'
  def new
    redirect_to :action => 'list' if session[:user].blank?
    @classified = Classified.new
     @categories = Category.find(:all)
  end
  def create
    @classified = Classified.new(params[:classified])
    @classified.user = session[:user]
    @classified.email = session[:user].email
      if @classified.save
      redirect_to home_url
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
      redirect_to :action => 'show', :id => @classified
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
  def delete
    Classified.find(params[:id]).destroy
    redirect_to :action => 'list'
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
