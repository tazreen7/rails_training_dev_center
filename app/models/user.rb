class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         enum role: [:associate, :manager]
has_many :associates
validates :email, presence:true
validates :encrypted_password, presence:true
has_many :subordinates, class_name: "User", foreign_key: "manager_id"
belongs_to :manager, class_name: "User", optional: true

  end
