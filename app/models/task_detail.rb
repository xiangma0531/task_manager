class TaskDetail < ApplicationRecord
  belongs_to :task_header

  validates :name, presence: true
  validates :due_date, presence: true
  validates :completed, inclusion: { in: [true, false] }
end
