class User < ActiveRecord::Base
  authenticates_with_sorcery!
  DEFAULT_DAY_START_TIME = 6
  DAY_START_TIMES = [["12:00am", 0], ["1:00am", 1], ["2:00am", 2], ["3:00am", 3],
                     ["4:00am", 4], ["5:00am", 5], ["6:00am", 6], ["7:00am", 7],
                     ["8:00am", 8], ["9:00am", 9], ["10:00am", 10], ["11:00am", 11],
                     ["12:00pm", 12], ["1:00pm", 13], ["2:00pm", 14], ["3:00pm", 15],
                     ["4:00pm", 16], ["5:00pm", 17], ["6:00pm", 18], ["7:00pm", 19],
                     ["8:00pm", 20], ["9:00pm", 21], ["10:00pm", 22], ["11:00pm", 23]]
  has_many :drinks, dependent: :destroy
  validates :email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  validates :day_start_time, presence: true
  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
end
