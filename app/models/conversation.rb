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

	def self.get_conversations(sender_id, recipient_id)
		return Conversation.where(:sender_id => sender_id , :recipient_id => recipient_id)
	end 

    #Loop around all the conversation and populate messages
	def self.get_populated_coversations_messages(conversations)
		conversation_array = Array.new
		conversations.each do |conversation|
	      if !conversation.nil? && !conversation.blank? && conversation.messages.exists?
	        active_conversations_hash = Hash.new
	        active_conversations_hash["conversation"] = conversation
	        active_conversations_hash["messages"] = conversation.messages
	        conversation_array.push(active_conversations_hash)
	      end 
	    end

	    return conversation_array 
	end	

end