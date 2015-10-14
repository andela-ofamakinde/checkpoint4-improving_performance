class Author < ActiveRecord::Base
  has_many :articles
  # after_save :clear_cache
  # after_destroy :clear_cache

  scope :with_most_upvoted_article, -> { includes(:articles).order('articles.upvotes asc').last.name }  

  scope :most_prolific_writer, -> { order('articles_count asc').last }

  def self.generate_authors(count=1000)
    count.times do
      Fabricate(:author)
    end
    first.articles << Article.create(name: "some commenter", body: "some body")
  end

  # def clear_cache
  #   Rails.cache.clear
  # end
end

