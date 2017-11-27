require "rails_helper"
require 'faker'
     
RSpec.describe User, :type => :model do
	describe "#user" do
		context "Check if user matches the validations for" do

			it "invalid username." do
				@user = User.new
					@user.username  = Faker::Name.first_name + Faker::Name.last_name + Faker::Number.number(30)
					@user.email  = Faker::Internet.email 

				@user.errors.messages.any?
				@user.save.should eq(false)
				
			end	

			it "invalid email" do

				@user = User.new
					@user.username  = Faker::Name.first_name + Faker::Name.last_name
					@user.email  = Faker::Internet.email + "@abcd.com"
						
				@user.errors.messages.any?
				@user.save.should eq(false)

			end	

			it "valid username and email." do
				@user = User.new
					@user.username  = Faker::Name.first_name + Faker::Name.last_name 
					@user.email  = Faker::Internet.email 

				@user.errors.messages.any?
				@user.save.should eq(true)
				
			end	

		end

	end

end

