class Targeting < ActiveRecord::Base
  belongs_to :ad
  has_many :places, dependent: :destroy

  accepts_nested_attributes_for :places, reject_if: proc { |attributes| attributes['place'].blank? }, allow_destroy: true

  def to_s
    bid
  end
end
