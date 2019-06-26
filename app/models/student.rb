class Student < ApplicationRecord
  GENDERS = %w(guy girl alien)
  OS = %w(MacOS Windows Linux)

  belongs_to :batch

  validates :full_name, presence: true, on: :create
  validates :gender, presence: true, on: :create
  validates :os, presence: true, on: :update
end
