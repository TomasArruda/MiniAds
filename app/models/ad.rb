class Ad < ActiveRecord::Base

  has_many :creatives, dependent: :destroy
  has_many :targetings, dependent: :destroy

  validates :budget, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :creatives, :presence => {message: "The ad needs to have at least one creative."}
  validates :targetings, :presence => {message: "The ad needs to have at least one targeting."}

  accepts_nested_attributes_for :creatives,
                                reject_if: proc { |attributes| attributes['bid'].blank? },
                                reject_if: proc { |attributes| attributes['adText'].blank? },
                                allow_destroy: true
  accepts_nested_attributes_for :targetings, reject_if: proc { |attributes| attributes['gender'].blank? }, allow_destroy: true

  def to_s
    budget
  end

end
