class List < ApplicationRecord
    
    has_many :list_items, dependent: :destroy
    accepts_nested_attributes_for :list_items, reject_if: :all_blank, allow_destroy: true
    
    validates :title, presence: true
end
