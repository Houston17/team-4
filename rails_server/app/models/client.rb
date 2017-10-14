class Client < ApplicationRecord
  has_many :events

  def to_s
    name
  end
end
