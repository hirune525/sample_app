class User < ActiveRecord::Base

  # 保存前にActiveRecodeから呼び出してもらいemailをすべて小文字にして保存
  before_save { self.email = email.downcase }

  # 存在(presence), 文字長検証, メール形式
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  # パスワード
  has_secure_password
  validates :password, length: { minimum: 6 }

end
