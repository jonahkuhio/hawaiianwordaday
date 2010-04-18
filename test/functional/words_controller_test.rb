require 'test_helper'

class WordsControllerTest < ActionController::TestCase
  context "GET index" do
    setup do
      get :index
    end
    should_respond_with :success
    should_render_template :index
    should_assign_to(:words)
  end

  context "GET show" do
    setup do
      @word = Factory(:word)
      get :show, :id => @word.id
    end
    should_respond_with :success
    should_assign_to(:word)
  end

  context "GET new" do
    context "as a logged in user" do
      setup do
        session[:user] = Factory(:user)
        get :new
      end
      should_respond_with :success
      should_assign_to(:word)
    end
  end

  context "POST create" do
    context "as a logged in user" do
      setup do
        session[:user] = Factory(:user)
      end
      context "with valid data" do
        setup do
          post :create, :word => {:term => 'term', :definition => 'definition', :word_in_context => 'word in context'}
        end
        should_redirect_to("home page") { root_path }
        should_assign_to(:word)
        should "create the word" do
          assert_equal false, assigns(:word).new_record?
        end
      end
      context "with invalid data" do
        setup do
          post :create
        end
        should_respond_with :success
        should_render_template :new
        should_assign_to(:word)
        should "not create the word" do
          assert_equal true, assigns(:word).new_record?
        end
      end
    end
  end

end
