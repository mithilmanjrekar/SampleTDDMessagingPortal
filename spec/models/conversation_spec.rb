require "rails_helper"
require 'faker'

RSpec.describe Conversation, :type => :model do
	describe "#conversation" do
		context "Check if sender_id and reciever_id" do

			it "are same." do

				@conversation = Conversation.new
				    common_sender_recipient_id = Faker::Number.number(6)
					@conversation.sender_id  = common_sender_recipient_id
					@conversation.recipient_id = common_sender_recipient_id
		
				@conversation.errors.messages.any?
				expect(@conversation.save).to eq(false)
				
			end	

			it "are not same." do

				@conversation = Conversation.new
					@conversation.sender_id  = Faker::Number.number(6)
					@conversation.recipient_id = Faker::Number.number(6)
				
				@conversation.errors.messages.any?
				expect(@conversation.save).to eq(true)

			end	

		end

		context "Check for sender id " do

			it "is null" do

				@conversation = Conversation.new
					@conversation.sender_id  = nil
					@conversation.recipient_id = Faker::Number.number(6)
				
				@conversation.errors.messages.any?
				expect(@conversation.save).to eq(false)

			end

			it "is not passed" do

				@conversation = Conversation.new
					@conversation.recipient_id = Faker::Number.number(6)
				
				@conversation.errors.messages.any?
				expect(@conversation.save).to eq(false)
			end

			it "is passed" do

				@conversation = Conversation.new
					@conversation.sender_id  = Faker::Number.number(6)
					@conversation.recipient_id = Faker::Number.number(6)
				
				@conversation.errors.messages.any?
				expect(@conversation.save).to eq(true)
			end
	    end

	    context "Check for recipient id " do
			
			it "is null" do

				@conversation = Conversation.new
					@conversation.sender_id  = Faker::Number.number(6)
					@conversation.recipient_id = nil
				
				@conversation.errors.messages.any?
				expect(@conversation.save).to eq(false)

			end

			it "is not passed" do

				@conversation = Conversation.new
				    @conversation.sender_id  = Faker::Number.number(6)

				@conversation.errors.messages.any?
				expect(@conversation.save).to eq(false)
				
			end

			it "is passed" do

				@conversation = Conversation.new
					@conversation.sender_id  = Faker::Number.number(6)
					@conversation.recipient_id = Faker::Number.number(6)

				@conversation.errors.messages.any?
				expect(@conversation.save).to eq(true)
			end
	    end
	end

end