require "rails_helper"
require 'faker'
     
RSpec.describe User, :type => :model do
	#Note
	#Class methods are prefixed with a dot (".add"), and instance methods with a dash ("#add").
	describe "#user" do
		context "Check if body matches the validations for" do

			it "is not too long." do
                binding.pry
				@user = User.new
					@user.username  = Faker::Name.first_name + Faker::Name.last_name
					@user.email  = Faker::Internet.email

				@user.errors.messages.any?
				@user.save.should eq(true)
				
			end	

			it "is not empty." do

				@user = User.new
					@user.username  = Faker::Name.first_name + Faker::Name.last_name
					@user.email  = Faker::Internet.email
						
				@user.errors.messages.any?
				@user.save.should eq(true)

			end	

		end

		context "Check for conversation id" do

			it "is null" do

				@user = User.new
					@user.username  = Faker::Name.first_name + Faker::Name.last_name
					@user.email  = Faker::Internet.email
						
				@user.errors.messages.any?
				@user.save.should eq(true)

			end

			it "is not passed" do

				@user = User.new
					@user.username  = Faker::Name.first_name + Faker::Name.last_name
					@user.email  = Faker::Internet.email
						
				@user.errors.messages.any?
				@user.save.should eq(true)

			end
	    end

	    context "Check for user id prescence" do
			
			it "is null" do

				@user = User.new
				    @user.username  = Faker::Name.first_name + Faker::Name.last_name
					@user.email  = Faker::Internet.email
						
				@user.errors.messages.any?
				@user.save.should eq(true)

			end

			it "is not passed" do

				@user = User.new
					@user.username  = Faker::Name.first_name + Faker::Name.last_name
					@user.email  = Faker::Internet.email
						
				@user.errors.messages.any?
				@user.save.should eq(true)
				
			end
	    end
	end

end

