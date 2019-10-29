class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum role: [:associate, :manager]
has_many :associates
validates :email, presence:true
validates :encrypted_password, presence:true
  end
