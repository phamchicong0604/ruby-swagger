class UserService < BaseService
  def initialize(user_repository = UserRepository.new)
    @user_repository = user_repository
  end

  def call
    # Implement service logic here
  end

  def create_user(attributes)
    @user_repository.create(attributes)
  end

  def update_user(id, attributes)
    @user_repository.update(id, attributes)
  end

  def delete_user(id)
    @user_repository.delete(id)
  end
end
