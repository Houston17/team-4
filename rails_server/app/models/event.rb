class Event < ApplicationRecord
  belongs_to :client

  validates_presence_of :title, :date, :description, :client
end
