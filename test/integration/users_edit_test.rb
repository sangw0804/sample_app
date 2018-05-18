require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end


  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {user: {name:"", email:"foo@invalid", password:"foo", password_conformation:"bar"}}

    assert_template 'users/edit'
    assert_select "div[class=?]","alert alert-danger","The form contains 3 errors."
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    assert_nil session[:forwarding_url]
    name = "Foo bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: {name:name, email:email, password:"",password_conformation:""}}

    assert_not flash.empty?
    assert_redirected_to user_path(@user)
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

end
