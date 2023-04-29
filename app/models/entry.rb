# frozen_string_literal: true

# `@meal_type[min: 2]`
# `@calories`
# `@proteins`
# `@carbohydrates`
# `@fats`
class Entry < ApplicationRecord
  validates :meal_type, length: { minimum: 2 }
  validates :meal_type,
            :calories,
            :proteins,
            :carbohydrates,
            :fats,
            presence: true

  before_save :title_fixer

  def day
    created_at.strftime('%b %e, %Y')
  end

  def title_fixer
    ## add a case to capitalize after [&, -, /]
    self.meal_type = meal_type.split(/ |_/).map(&:capitalize).join(' ')
  end
end
