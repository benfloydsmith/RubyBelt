class Event < ActiveRecord::Base
  belongs_to :user
  validates :name, :date, :city, :state, presence: true
  has_many :attends, dependent: :destroy
  has_many :users, through: :attends
  has_many :comments
end
