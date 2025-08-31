class UsersController < ApplicationController
  def test_email
    user = User.new(email: 'test@example.com')  # Replace with a valid test user's email
    UserMailer.welcome_email(user).deliver_now

    # Optionally, you can set a flash message to confirm that the email has been sent
    #flash[:notice] = 'Test email sent!'
    #redirect_to root_path  # Redirect to a suitable path (e.g., homepage)
  end

  def index
    @user = User.all
  end
  
end