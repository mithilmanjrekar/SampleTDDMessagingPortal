require "rails_helper"
require 'faker'

RSpec.describe Message, :type => :model do
	#Note
	#Class methods are prefixed with a dot (".add"), and instance methods with a dash ("#add").
	describe "#message" do
		context "Check if body matches the validations for" do

			it "is not too long." do

				@message = Message.new
					@message.body  = "More than ten characters set."
					@message.conversation_id = Faker::Number.number(6)
					@message.user_id = Faker::Number.number(6)
		
				@message.errors.messages.any?
				@message.save.should eq(true)
				
			end	

			it "is too long." do

				@message = Message.new
					@message.body  = "More than thirty characters set to exceed the limit."
					@message.conversation_id = Faker::Number.number(6)
					@message.user_id = Faker::Number.number(6)
				
				@message.errors.messages.any?
				@message.save.should eq(false)

			end	

			it "is empty." do

				@message = Message.new
					@message.body  = ""
					@message.conversation_id = Faker::Number.number(6)
					@message.user_id = Faker::Number.number(6)
				
				@message.errors.messages.any?
				@message.save.should eq(false)

			end	

		end

		context "Check for conversation id " do

			it "is null" do

				@message = Message.new
					@message.body  = "User id to be nil test"
					@message.conversation_id = nil
					@message.user_id = Faker::Number.number(6)
				
				@message.errors.messages.any?
				@message.save.should eq(false)

			end

			it "is not passed" do

				@message = Message.new
					@message.body  = "User id is not passed test"
					# @message.conversation_id = 4
					@message.user_id = Faker::Number.number(6)
				
				@message.errors.messages.any?
				@message.save.should eq(false)
			end

			it "is passed" do

				@message = Message.new
					@message.body  = "User id is not passed test"
					@message.conversation_id = Faker::Number.number(6)
					@message.user_id = Faker::Number.number(6)
				
				@message.errors.messages.any?
				@message.save.should eq(true)
			end
	    end

	    context "Check for user id " do
			
			it "is null" do

				@message = Message.new
					@message.body  = "User id to be nil test"
					@message.conversation_id = Faker::Number.number(6)
					@message.user_id = nil
				
				@message.errors.messages.any?
				@message.save.should eq(false)

			end

			it "is not passed" do

				@message = Message.new
					@message.body  = "User id is not passed test"
					@message.conversation_id = Faker::Number.number(6)
					# @message.user_id = 

				@message.errors.messages.any?
				@message.save.should eq(false)
				
			end

			it "is passed" do

				@message = Message.new
					@message.body  = "User id is not passed test"
					@message.conversation_id = Faker::Number.number(6)
					@message.user_id = Faker::Number.number(6)
				
				@message.errors.messages.any?
				@message.save.should eq(true)
			end
	    end
	end

end
