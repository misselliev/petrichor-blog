# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :articles_categories
  has_many :articles, through: :articles_categories
  
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end
