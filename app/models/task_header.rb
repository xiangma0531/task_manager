class TaskHeader < ApplicationRecord
  belongs_to :user
  has_many :task_details, dependent: :destroy

  validates :title, presence: true
end
