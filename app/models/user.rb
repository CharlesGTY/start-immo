class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :agence
  has_many :houses

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
