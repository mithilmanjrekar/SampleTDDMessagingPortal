require "rails_helper"


RSpec.describe ConversationsController do
  
  describe "GET get_all_conversations_by_user" do
    it "gets conversation with messages linked to it" do
      get :get_all_conversations_by_user ,id: 4 , format: :json
      #post sensors_path, sensor: @sensor_attributes, format: :json
      #response.status.should eql(200)
      response_body = JSON.parse(response.body)
      expect(response_body["status"]).to eql(200)
    end

  end

  describe "GET get_conversation" do
   
    it "gets all conversations by users." do
      get :get_conversation  ,id: 2 , format: :json
      binding.pry
      response_body = JSON.parse(response.body)
      expect(response_body["status"]).to eql(200)
    end

  end

  describe "GET get_all_conversations_by_user" do
    it "gets conversation with messages linked to it" do

      conversation =  Hash.new
      conversation["sender_id"]  = Faker::Number.number(6)
      conversation["recipient_id"] = Faker::Number.number(6)
    
      post :create, conversation: conversation, format: :json
     
      response_body = JSON.parse(response.body)
      expect(response_body["status"]).to eql(200)
    end


  end


end