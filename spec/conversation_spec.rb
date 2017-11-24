require "rails_helper"

RSpec.describe Conversation, :type => :model do

#Note
#Class methods are prefixed with a dot (".add"), and instance methods with a dash ("#add").
describe ".add" do
	context "given an empty string" do
		it "returns zero" do
			expect(0).to eql(0)
			#Rspec Matchers 
			#https://relishapp.com/rspec/rspec-expectations/v/3-1/docs/built-in-matchers
			# Equality matchers
			# Comparison matchers
			# Predicate matchers
			# Type matchers
			# `all` matcher
			# `be` matchers
			# `be_within` matcher
			# `change` matcher
			# `contain_exactly` matcher
			# `cover` matcher
			# `end_with` matcher
			# `exist` matcher
			# `have_attributes` matcher
			# `include` matcher
			# `match` matcher
			# `raise_error` matcher
			# `respond_to` matcher
			# `satisfy` matcher
			# `start_with` matcher
			# `throw_symbol` matcher
			# `yield` matchers
			# `output` matcher
		end	
	end

	context "given '4'" do
      it "returns 4" do
        expect(0).to eql(0)
      end
    end

    context "given '10'" do
      it "returns 10" do
        expect(0).to eql(0)
      end
    end
end

   
end