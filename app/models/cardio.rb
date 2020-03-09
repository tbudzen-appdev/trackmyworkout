# == Schema Information
#
# Table name: cardios
#
#  id          :integer          not null, primary key
#  cardio_type :string
#  time        :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  ex_id       :integer
#

class Cardio < ApplicationRecord
belongs_to :ex, :class_name => "Exercise"
has_one :user, :through => :ex, :source => :user  
end
