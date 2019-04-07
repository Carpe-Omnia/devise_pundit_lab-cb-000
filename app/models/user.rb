class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
         #:recoverable, :rememberable, :trackable, :confirmable,
  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note
  enum :role => [ :normal, :mod, :admin]

end
