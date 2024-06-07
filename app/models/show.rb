class Show < ApplicationRecord
  belongs_to :channel

  validates :name, :start_time, :end_time, :channel_id, presence: true
  
  def self.search(search)
    joins(:channel).where("shows.name LIKE (?) OR channels.name LIKE (?)", "%#{search}%", "%#{search}%")
  end
end
