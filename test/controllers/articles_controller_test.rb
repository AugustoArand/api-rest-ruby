require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = Article.create(title: "Test Article", content: "Test content", published: true)
  end

  test "should get index" do
    get articles_url, as: :json
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count', 1) do
      post articles_url, params: { article: { title: "New Article", content: "New content" } }, as: :json
    end
    assert_response :created
  end

  test "should not create article with invalid params" do
    assert_no_difference('Article.count') do
      post articles_url, params: { article: { title: "A", content: "Content" } }, as: :json
    end
    assert_response :unprocessable_entity
  end

  test "should show article" do
    get article_url(@article), as: :json
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params: { article: { title: "Updated Title" } }, as: :json
    assert_response :success
    @article.reload
    assert_equal "Updated Title", @article.title
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article), as: :json
    end
    assert_response :no_content
  end

  test "should return not found for non-existent article" do
    get article_url(id: 9999), as: :json
    assert_response :not_found
  end
end
