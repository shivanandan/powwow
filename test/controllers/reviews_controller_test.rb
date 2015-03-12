require 'test_helper'

class ReviewsControllerTest < ActionController::TestCase
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post :create, review: { comment_to_admin: @review.comment_to_admin, comment_to_applicant: @review.comment_to_applicant, conservation_score: @review.conservation_score, finalized: @review.finalized, recommendation: @review.recommendation, science_score: @review.science_score, submission_id: @review.submission_id, user_id: @review.user_id, view_count: @review.view_count, visual_score: @review.visual_score }
    end

    assert_redirected_to review_path(assigns(:review))
  end

  test "should show review" do
    get :show, id: @review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @review
    assert_response :success
  end

  test "should update review" do
    patch :update, id: @review, review: { comment_to_admin: @review.comment_to_admin, comment_to_applicant: @review.comment_to_applicant, conservation_score: @review.conservation_score, finalized: @review.finalized, recommendation: @review.recommendation, science_score: @review.science_score, submission_id: @review.submission_id, user_id: @review.user_id, view_count: @review.view_count, visual_score: @review.visual_score }
    assert_redirected_to review_path(assigns(:review))
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete :destroy, id: @review
    end

    assert_redirected_to reviews_path
  end
end
