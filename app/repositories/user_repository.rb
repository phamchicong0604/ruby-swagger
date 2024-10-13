class UserRepository < BaseRepository
  def initialize
    super(User)
  end

  # Add custom query methods here
  def find_by_email(email)
    @model_class.find_by(email: email)
  end
end
