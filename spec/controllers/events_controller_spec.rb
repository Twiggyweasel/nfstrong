require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Test. As you add validations to Test, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { title: "test" }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TestsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "renders the index template" do 
      get :index
      expect(response).to render_template("index")
    end
    
    it "loads all of the donations into @donations" do
      test = Event.create! valid_attributes
      get :index, session: valid_session
      expect(assigns(:events)).to eq([test])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      test = Event.create! valid_attributes
      get :show, params: {id: test.to_param}, session: valid_session
      expect(response).to have_http_status(:success)
    end
    
    it "renders the show template" do
      test = Event.create! valid_attributes
      get :show, params: {id: test.to_param}, session: valid_session
      expect(response).to render_template("show")
    end
  end
end
