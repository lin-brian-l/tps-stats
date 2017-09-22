class Entry < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :title, :body, { presence: true }

  def self.most_recent
    Entry.order(created_at: :desc).limit(5)
  end
end
