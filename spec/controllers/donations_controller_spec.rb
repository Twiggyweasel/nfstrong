require 'rails_helper'

RSpec.describe DonationsController, type: :controller do
  
  let(:reference_event){
    Event.create! title: "test"
  }
  
  let(:valid_attributes){
    { amount: 10.00 }
    { event_id: :event }
  }
  
  let(:invalid_attributes){
    skip("add invalid_attributes here")
  }
  
  let(:valid_session){}
  
  describe "GET #new" do
    it "returns http success" do
      context = reference_event
      test = context.donations.new
      get :new, params: {event_id: context.to_param}
      expect(response).to have_http_status(:success)
    end
  
    it "renders the index template" do 
      context = reference_event
      test = context.donations.new
      get :new, params: {event_id: context.to_param}
      expect(response).to render_template("new")
    end
    
    it "assigns a new test as @test" do
      context = reference_event
      test = context.donations.new
      get :new, params: {event_id: context.to_param}
      expect(assigns(:donation)).to be_a_new(Donation)
    end
  end
end
