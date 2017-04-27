class Location < ApplicationRecord
    belongs_to :user
    after_create_commit { LocationBroadcastJob.perform_later self}
end
