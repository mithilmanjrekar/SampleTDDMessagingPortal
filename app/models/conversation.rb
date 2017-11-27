class Conversation < ActiveRecord::Base
    
    #User has many conversations 
	belongs_to :user
	#Conversation has many messages
	has_many   :messages

	validates :sender_id , :presence => true , :allow_blank => false , :allow_nil => false
	validates_length_of :sender_id, :minimum => 1, :maximum => 32
	validates :recipient_id , :presence => true , :allow_blank => false , :allow_nil => false
	validates_length_of :recipient_id, :minimum => 1, :maximum => 32
    validate :check_sender_is_different_from_recipient
 
	private
	def check_sender_is_different_from_recipient
		if sender_id == recipient_id
		  errors.add(:sender_id, "Sender_id cannot be same as recipient_id.")
		  errors.add(:recipient_id, "Recipient_id cannot be same as sender_id.")
		end
	end

end