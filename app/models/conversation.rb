class Conversation < ActiveRecord::Base
    
    #User has many conversations 
	belongs_to :user
	#Conversation has many messages
	has_many   :messages

	validates :sender_id , :presence => true , :allow_blank => false , :allow_nil => false
	validates :recipient_id , :presence => true , :allow_blank => false , :allow_nil => false
    validate :check_sender_is_different_from_recipient
 
	private
	def check_sender_is_different_from_recipient
		if sender_id == recipient_id
		  errors.add(:sender_id, "Cannot be same as recipient_id")
		  errors.add(:recipient_id, "Cannot be same as sender_id")
		end
	end

end