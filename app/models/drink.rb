class Drink < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :volume, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
