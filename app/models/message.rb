class Message < ActiveRecord::Base
	
	#User belongs to conversations 
	belongs_to :conversation
    

	validates :body, :allow_blank => false , :allow_nil => false , :length => {:maximum => 30, :message => 'Message body cannot exceed the maximum message limit.'}
    validates :conversation_id, :presence => true , :allow_blank => false , :allow_nil => false
    validates_length_of :conversation_id, :minimum => 1, :maximum => 32
    validates :user_id, :presence => true , :allow_blank => false , :allow_nil => false
    validates_length_of :user_id, :minimum => 1, :maximum => 32

end
