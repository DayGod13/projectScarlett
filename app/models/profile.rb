class Profile < ApplicationRecord
    belongs_to :user
    has_many :comments
    mount_uploader :avatar, AvatarUploader

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :nickname, presence: true
    validates :age, presence: true, numericality: {greater_than_or_equal_to: 0}

end
