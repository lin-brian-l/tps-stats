class Entry < ApplicationRecord
  belongs_to :user

  validates :title, { presence: true }
  validates :body, {presence: true}

  def self.most_recent
    Entry.order(created_at: :desc).limit(5)
  end
end
