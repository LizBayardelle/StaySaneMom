class Gift < ApplicationRecord
  # Validations
  validates_presence_of :person, :occasion

  # Relations
  belongs_to :user, optional: true
  belongs_to :occasion
  belongs_to :person

  after_create :set_user_id

  private
  def set_user_id
    self.update_column(:user_id, self.occasion.user_id)
  end
end
