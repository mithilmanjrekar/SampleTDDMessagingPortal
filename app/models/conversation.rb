class Conversation < ActiveRecord::Base
    
    #User has many conversations 
	belongs_to :user
	#Conversation has many messages
	has_many   :messages

	validates :sender_id ,:presence => true
	validates :recipient_id ,:presence => true
	validates :check_sender_isdifferentfrom_recipient

	def check_sender_is_different_from_recipient 
       errors.add(:sender_id, "Sender cannot be same as recipient") if sender_id == recipient_id
    end

end