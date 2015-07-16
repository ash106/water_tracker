class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :drinks, dependent: :destroy
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
