require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Article.new(content: "Test content")
    assert_not article.save, "Saved the article without a title"
  end

  test "should not save article without content" do
    article = Article.new(title: "Test Title")
    assert_not article.save, "Saved the article without content"
  end

  test "should not save article with short title" do
    article = Article.new(title: "Ab", content: "Test content")
    assert_not article.save, "Saved the article with a short title"
  end

  test "should save valid article" do
    article = Article.new(title: "Test Title", content: "Test content")
    assert article.save, "Could not save a valid article"
  end

  test "published should default to false" do
    article = Article.create(title: "Test Title", content: "Test content")
    assert_equal false, article.published, "Published should default to false"
  end
end
