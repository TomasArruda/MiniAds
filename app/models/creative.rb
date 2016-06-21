class Creative < ActiveRecord::Base
  belongs_to :ad

  validates :bid, presence: true
  validates :adText, presence: true

  def to_s
    bid
  end

end
