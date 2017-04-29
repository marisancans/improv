module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :location_user

    def connect
      self.location_user = find_verified_user
      logger.add_tags 'ActionCable', location_user.username
    end

    protected
      def find_verified_user
        verified_user = User.find_by(id: cookies.signed['user.id'])
        if verified_user && cookies.signed['user.expires_at'] > Time.now
          verified_user
        else
          reject_unauthorized_connection
        end
      end
  end
end