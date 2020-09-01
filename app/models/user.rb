class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :trades, dependent: :destroy

  validates :nickname, presence: true, length: { maximum: 6 }
 
  validates :first_name, presence: true, format: { message: "は全角で入力して下さい"}}

  validates :last_name, presence: true, format: { message: "は全角で入力して下さい"}}

  validates :first_name_kana, presence: true, format: { message: "は全角カタカナのみで入力して下さい"}}

  validates :last_name_kana, presence: true, format: { message: "は全角カタカナのみで入力して下さい"}}

  validates :birth_date, length: { maximum: 8 } ,presence: true,format: { message: "は西暦から数字８桁で入力して下さい"}}

  validates :email, {presence: true, uniqueness: { case_sensitive: false }}

  validates :encrypted_password, null: false, default format: { message: "は半角7~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}}

end
