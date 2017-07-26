class Cat < ActiveRecord::Base
  CAT_COLORS = ["white", "black", "brown"]
  validates :birth_date, :color, :sex, :name, :description, presence: true
  validates :color, inclusion: { in: CAT_COLORS }
  validates :sex, inclusion: { in: %w(M F) }

  def self.colors
    CAT_COLORS
  end

  def age
    current_date = Time.now
    current_date.year - self.birth_date.year
  end
end
