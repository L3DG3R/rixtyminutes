class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # TO LEARN MORE ABOUT MODEL VALIDATIONS (http://www.guides.rubyonrails.org/active_record_validations.html)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         
  validates :fullname, presence: true, length: {maximum: 50}       
end
