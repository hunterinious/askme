class Tag < ApplicationRecord
  REGEXP_HASH_TAG = /#[[:word:]-]+/

  has_and_belongs_to_many :questions

  validates :name, presence: true, uniqueness: true, format: { with: REGEXP_HASH_TAG }

  before_validation :name_downcase

  def name_downcase
    self.name = to_downcase(name) if name.present?
  end

  def self.remove_unlinked_tags!
    Tag.left_outer_joins(:questions).where(questions: { id: nil }).destroy_all
  end
end
