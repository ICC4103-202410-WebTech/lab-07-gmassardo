class Post < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :tags
    has_many :child_posts, class_name: "Post", foreign_key: "parent_id"
    belongs_to :parent_post, class_name: "Post", optional: true, foreign_key: "parent_id"

    validates :title, presence: {message: "What about the title of your post?"}
    validates :content, presence: {message: "Do you really want to publish a post without content??"}
    validates :user_id, presence: {message: "User id is missing."}
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "The answers count must be greater than or equal to zero." }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "The likes count must be greater than or equal to zero." }
    validates :published_at, presence: true

    before_validation :set_default_published_at, if: -> { published_at.blank? }

    private

    def set_default_published_at
        self.published_at = Time.zone.now
      end
end