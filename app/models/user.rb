# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  d_o_b           :date
#  email           :string
#  height_ft       :integer          default(0)
#  height_in       :integer          default(0)
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many :exercises, :dependent => :destroy 

  has_many :cardios, :through => :exercises, :source => :cardio
  has_many :weights, :through => :exercises, :source => :weight


end
