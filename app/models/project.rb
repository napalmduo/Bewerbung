class Project < ActiveRecord::Base
  has_many :texts, dependent: :destroy
  validates :Name, presence: true,
            length: { minimum: 1 }
end
