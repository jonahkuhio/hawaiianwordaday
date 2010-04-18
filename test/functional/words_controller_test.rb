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

  context "GET edit" do
    setup do
      @word = Factory(:word)
      get :edit, :id => @word.id
    end
    should_respond_with :success
    should_render_template :edit
    should_assign_to(:word)
  end

  context "PUT update" do
    context "with valid data" do
      setup do
        @word = Factory(:word)
        put :update, :id => @word.id, :word => {:term => 'new term'}
      end
      should_redirect_to("word") { word_path(@word) }
      should "update the word" do
        assert_equal 'new term', assigns(:word).term
      end
    end
    context "with a non-unique word" do
      should_eventually "be tested"
    end
  end

  context "DELETE destroy" do
    setup do
      @word = Factory(:word)
      delete :destroy, :id => @word.id
    end
    should_redirect_to("home") { root_path }
    should "delete the record" do
      assert_raise(ActiveRecord::RecordNotFound) do
        Word.find(@word.id)
      end
    end
  end

  # AJAX
  context "GET search" do
    context "with a letter" do
      context "and a word exists starting with that letter" do
        setup do
          @word = Factory(:word)
          get :search, :search => @word.term.first
        end
        should_respond_with :success
        should_assign_to :words
        should_eventually "render the partial"
      end
      context "and no word exists" do
        should_eventually "be tested"
      end
      context "with no text" do
        should_eventually "be tested"
      end
    end

    context "GET contact" do

    end

  end
end
