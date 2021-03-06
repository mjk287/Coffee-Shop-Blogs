class User < ApplicationRecord
  has_many :blogs
  has_many :likes
  has_many :liked_blogs, through: :likes, source: :blog
  has_many :comments
  has_many :commented_blogs, through: :comments, source: :blog
  belongs_to :coffee_shop
  has_secure_password

  validates :full_name, presence:true
  validates :user_name, presence:true, uniqueness:true
  validates :password, presence:true

  def top_user_blog
    self.blogs.select do |blog|
      blog.likes.count
    end.first
  end


end
