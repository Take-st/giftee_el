class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validate :validate_name_not_including_comma
  validates :deadline_at, presence: true

  # Search method(add search)
  def self.search(name)
    if name
      Task.where(['name ILIKE ? or status ILIKE ?' , "%#{name}%", "%#{name}%"])
    else
      Task.all
    end
  end

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end

end