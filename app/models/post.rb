class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Non-Fiction', 'Fiction']}
  validate :clickybaity?

  TITLES = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def clickybaity?
    if TITLES.none? { |name| name.match title }
      errors.add(:title, "Title must be a clickbait")
    end
  end
end
