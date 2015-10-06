class Author < ActiveRecord::Base
  has_many :articles
  after_save :expire_author_fragment

  scope :with_most_upvoted_article, -> { includes(:articles).order('articles.upvotes desc').first.name }  

  scope :most_prolific_writer, -> { order('articles_count desc').first }

  def self.generate_authors(count=1000)
    count.times do
      Fabricate(:author)
    end
    first.articles << Article.create(name: "some commenter", body: "some body")
  end

end

