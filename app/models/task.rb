class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validate :validate_name_not_including_comma
  validates :deadline_at, presence: true

  has_many :task_categories, dependent: :destroy
  has_many :categories, through: :task_categories

  belongs_to :user

  scope :from_category, ->(category_id) { where(id: @task_ids = TaskCategory.where(category_id: category_id).select(:task_id))}

  # Search method(add search)
  # だめ
  def self.search(name)
    if name
      Task.where(['name ILIKE ? or status ILIKE ?' , "%#{name}%", "%#{name}%"])
    else
      Task.all
    end
  end

  #category追加
  def save_categories(tags)
    current_tags = self.categories.pluck(:name) unless self.categories.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    #destroy old taggings:
    old_tags.each do |old_name|
      self.categories.delete Category.find_by(name: old_name)
    end

    #create new taggings:
    new_tags.each do |new_name|
      task_category = Category.find_or_create_by(name: new_name)
      self.categories << task_category
    end
  end


  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end

end