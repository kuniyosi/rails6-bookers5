class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy


  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def Book.search(search, model, how)
    if how == "partical"
  	  Book.where("title LIKE ?", "%#{search}%")
    elsif how == "forward"
  	  Book.where("title LIKE ?", "#{search}%")
    elsif how == "backward"
  	  Book.where("title LIKE ?", "%#{search}")
    elsif how == "match"
  	  Book.where("title LIKE ?", "#{search}")
    end
  end
end
