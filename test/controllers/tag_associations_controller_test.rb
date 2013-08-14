require 'test_helper'

class TagAssociationsControllerTest < ActionController::TestCase
  setup do
    @tag_association = tag_associations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_association" do
    assert_difference('TagAssociation.count') do
      post :create, tag_association: { note_id: @tag_association.note_id, tag_id: @tag_association.tag_id }
    end

    assert_redirected_to tag_association_path(assigns(:tag_association))
  end

  test "should show tag_association" do
    get :show, id: @tag_association
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag_association
    assert_response :success
  end

  test "should update tag_association" do
    patch :update, id: @tag_association, tag_association: { note_id: @tag_association.note_id, tag_id: @tag_association.tag_id }
    assert_redirected_to tag_association_path(assigns(:tag_association))
  end

  test "should destroy tag_association" do
    assert_difference('TagAssociation.count', -1) do
      delete :destroy, id: @tag_association
    end

    assert_redirected_to tag_associations_path
  end
end
