class Question < ApplicationRecord

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
  has_and_belongs_to_many :tags

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }

  before_save :update_tags

  # after_commit { Tag.remove_unlinked_tags! }

  def update_tags
    parse_text = self.text.to_s + ' ' + self.answer.to_s

    self.tags = Tag.parse_hash_tags(parse_text).map do |tag_name|
      Tag.find_or_create_by(name: to_downcase(tag_name))
    end
  end
end
