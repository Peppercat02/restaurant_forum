class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

    validates_presence_of :name
    mount_uploader :avatar, PhotoUploader


    # 如果 User 已經有了評論，就不允許刪除帳號（刪除時拋出 Error）
    has_many :comments, dependent: :restrict_with_error
    has_many :restaurants, through: :comments

    # 「使用者收藏很多餐廳」的多對多關聯
    has_many :favorites, dependent: :destroy
    has_many :favorited_restaurants, through: :favorites, source: :restaurant

    has_many :followships, dependent: :destroy
    has_many :followings, through: :followships
    # admin? 讓我們用來判斷單個user是否有 admin 角色，列如：current_user.admin?
    def admin?
        self.role == "admin"
    end

    def following?(user)
        self.followings.Include?(user)
    end
end
