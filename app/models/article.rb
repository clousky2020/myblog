class Article < ApplicationRecord
  validates :title, uniqueness: true
end
