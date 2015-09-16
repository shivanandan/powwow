require 'test_helper'

class FeedbacksControllerTest < ActionController::TestCase
  setup do
    @feedback = feedbacks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedbacks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedback" do
    assert_difference('Feedback.count') do
      post :create, feedback: { additional_comments: @feedback.additional_comments, compare: @feedback.compare, food: @feedback.food, overall_rating: @feedback.overall_rating, overall_suggestions: @feedback.overall_suggestions, plenary: @feedback.plenary, plenary_topic1: @feedback.plenary_topic1, plenary_topic2: @feedback.plenary_topic2, plenary_topic3: @feedback.plenary_topic3, scheduling: @feedback.scheduling, scheduling_comments: @feedback.scheduling_comments, workshop_topic1: @feedback.workshop_topic1, workshop_topic2: @feedback.workshop_topic2, workshop_topic3: @feedback.workshop_topic3 }
    end

    assert_redirected_to feedback_path(assigns(:feedback))
  end

  test "should show feedback" do
    get :show, id: @feedback
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedback
    assert_response :success
  end

  test "should update feedback" do
    patch :update, id: @feedback, feedback: { additional_comments: @feedback.additional_comments, compare: @feedback.compare, food: @feedback.food, overall_rating: @feedback.overall_rating, overall_suggestions: @feedback.overall_suggestions, plenary: @feedback.plenary, plenary_topic1: @feedback.plenary_topic1, plenary_topic2: @feedback.plenary_topic2, plenary_topic3: @feedback.plenary_topic3, scheduling: @feedback.scheduling, scheduling_comments: @feedback.scheduling_comments, workshop_topic1: @feedback.workshop_topic1, workshop_topic2: @feedback.workshop_topic2, workshop_topic3: @feedback.workshop_topic3 }
    assert_redirected_to feedback_path(assigns(:feedback))
  end

  test "should destroy feedback" do
    assert_difference('Feedback.count', -1) do
      delete :destroy, id: @feedback
    end

    assert_redirected_to feedbacks_path
  end
end
