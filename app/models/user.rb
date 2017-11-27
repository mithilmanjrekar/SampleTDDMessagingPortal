class User < ActiveRecord::Base

	#User has many conversations 
	has_many   :conversations

    validates :username , :presence => true , :allow_blank => false , :allow_nil => false
    validates :email, :email_format => { :message => 'Is not looking good' }

end
