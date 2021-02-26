class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validatables :nickname, presence: true
  validatables :first_name, presence: true
  validatables :last_name, presence: true
  validatables :first_name_kana, presence: true
  validatables :last_name_kana, presence: true
  validatables :birthday, presence: true

end