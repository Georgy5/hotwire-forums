class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  validates :name, presence: true

  broadcasts_to -> (discussion) { "discussions" }, inserts_by: :prepend

  def to_param
    "#{id}-#{name.to_s[0...100].parameterize}"
  end
end
