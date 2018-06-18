class Sale < ApplicationRecord
  belongs_to :file_import

  validates :file_import, presence: true
end
