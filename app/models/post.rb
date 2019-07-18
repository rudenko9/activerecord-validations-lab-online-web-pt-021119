class Post < ActiveRecord::Base
  validate :click_baity_title, on: :create
  validates :title , presence: true
  validates(:content, { :length => { :is => 250 } })
  validates(:summary, { :length => { :maximum => 250 } })
 validates :category, inclusion: { in: %w(fiction non-fiction) }

def click_baity_title
    if self.title && !self.title.match?(/(Won't\sBelieve)|(Secret)|(Top\d+)|(Guess)/)
      errors.add(:title, "Doesn't have an h")
    end
  end

end
