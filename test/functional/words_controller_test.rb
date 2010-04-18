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
end
