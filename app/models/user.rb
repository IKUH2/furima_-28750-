class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :trades, dependent: :destroy

  validates :nickname, presence: true

  validates :first_name, presence: true, format: { with: /\A[一-龥]+\z/, message: "は全角で入力してください"}

  validates :last_name, presence: true, format: { with: /\A[一-龥]+\z/, message: "は全角で入力してください"}

  validates :first_name_kana, presence: true,allow_blank: false, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい"}

  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい"}

  validates :birth_date ,null: false , presence: { message: "は西暦から数字８桁で入力して下さい"}

  validates :email, {presence: true, uniqueness: { case_sensitive: false }}

  validates :password, null: false,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze ,message: "は半角7~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}

end
