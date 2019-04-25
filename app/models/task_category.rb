class TaskCategory < ApplicationRecord
  belongs_to :task
  belongs_to :category
  validates :task_id, presence: true
  validates :category_id, presence: true
end
