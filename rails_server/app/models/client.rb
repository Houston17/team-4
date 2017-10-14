class Client < ApplicationRecord
  has_many :events

  validates_presence_of :name

  def to_s
    name
  end
end
