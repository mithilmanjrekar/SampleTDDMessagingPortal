class Message < ActiveRecord::Base
	
	 #User belongs to conversations 
	belongs_to :conversation
    

	validates :body, :allow_blank => false , :allow_nil => false , :length => {:maximum => 30, :message => ' is a bit long...'}
    validates :conversation_id, :presence => true , :allow_blank => false , :allow_nil => false
    validates :user_id, :presence => true , :allow_blank => false , :allow_nil => false

end
