require 'test_helper'

class ListsListupTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:archer)
    @list = lists(:one)
  end
 
 test "valid list info" do
   get login_path
   assert_template "sessions/new"
   post sessions_path, params: { session: { name: @user.name, password: 'password' } }
  log_in_as @user
  assert is_logged_in?
   get lists_path
   assert_template "lists/index"
   assert_select "a[href=?]", new_list_path
  get new_list_path
  assert_difference 'List.count', 1 do
    post lists_path, params:{list:{title:"one"}}
  end
  follow_redirect!
 end

end
