class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :loads
  has_many :trucks
  has_many :freights, through: :trucks
  has_one_attached :avatar

  validates :role, inclusion: {in: ["Transportista", "Cargador"]}
end
