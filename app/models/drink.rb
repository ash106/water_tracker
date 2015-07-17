class Drink < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  validates :user_id, presence: true
  validates :volume, presence: true, numericality: { greater_than_or_equal_to: 1 }
  self.per_page = 15

  def self.total(drinks)
    drinks.map(&:volume).sum
  end
end
