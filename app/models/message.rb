class Message < ActiveRecord::Base
	
	 #User belongs to conversations 
	belongs_to :conversation
    

	validates :body, :presence => true, :length => {:maximum => 30000, :message => ' is a bit long...'}
    validates :conversation_id, :presence => true
    validates :user_id, :presence => true


end
