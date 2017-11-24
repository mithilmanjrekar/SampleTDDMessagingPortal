class User < ActiveRecord::Base

	#User has many conversations 
	has_many   :conversations


	VALID_USERNAME_REGEX = /^[a-zA-Z0-9]+$/
    validates :username, presence: true, length: { maximum: 20 },
                                    format: { with: VALID_USERNAME_REGEX },
                                    uniqueness: { case_sensitive: false }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }

end
