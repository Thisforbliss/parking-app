class Helpers

  def self.current_user(session_hash)
    @driver = Driver.find(session_hash[:driver_id])
  end

  def self.is_logged_in?(session_hash)
    !!session_hash[:driver_id]
  end

end
