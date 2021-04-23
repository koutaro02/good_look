class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :position

  with_options presence: true do
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は、全角（漢字・ひらがな・カタカナ）で入力してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は、全角（漢字・ひらがな・カタカナ）で入力してください'}
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'は、(-)ハイフン無し、または11桁以内の数字で入力してください'}
    validates :company_name, format: { with: /\A[A-Zぁ-んァ-ン一-龥]+\z/, message: 'は、全角（漢字・ひらがな・カタカナ）、または英字(大文字)で入力してください'}
  end

  validates :position_id, numericality: { other_than: 0, message: "can't be blank"}
end
