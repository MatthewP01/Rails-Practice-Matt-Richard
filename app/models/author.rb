class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books

  validates :name, presence: true
  validates :birth_year, presence: true
  validates :birth_year, numericality: {only_integer: true}
  validates :birth_year, numericality: {less_than_or_equal_to: 2019}
  validates :birth_year, numericality: {greater_than_or_equal_to: 0}

  def name_and_year
    self.name + "(b." + self.birth_year.to_s + ")"
  end

end
