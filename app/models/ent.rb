class Ent < ApplicationRecord
  before_create :set_reviewid

  private
    def set_reviewid
      self.reviewid = SecureRandom.urlsafe_base64(9)
    end
end
