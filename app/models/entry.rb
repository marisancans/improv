class Entry < ActiveRecord::Base
  belongs_to :feed, dependent: :destroy
end
