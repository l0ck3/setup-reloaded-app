class Batch < ApplicationRecord
  has_many :students

  validates :slug, presence: true, uniqueness: true

  def to_param
    slug
  end
end
