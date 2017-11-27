class User < ActiveRecord::Base

	#User has many conversations 
	has_many   :conversations

    validates :username , :presence => true , :allow_blank => false , :allow_nil => false 
    validates_length_of :username, :minimum => 5, :maximum => 15
    validates :email, :email_format => { :message => 'Please enter a valid email id.' }

end
