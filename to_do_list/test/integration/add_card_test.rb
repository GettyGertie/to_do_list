require 'test_helper'

class AddCardTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:archer)
    @list = (:one)
    @card = (:onec)
  end
 
 test "valid card info" do
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
   # assert_select "a[href=?]", list_path(id: @list.id)
   get list_path(list_id: 1)

   # assert_select "a[href=?]", new_card_path
   #  get new_card_path

  # assert_difference 'List.count', 1 do
   #  post cards_path, params:{list:{title:"one", description:"oneonone"}}
  # end
  # follow_redirect!
 # end

 # test "should move card" do

 end
end
