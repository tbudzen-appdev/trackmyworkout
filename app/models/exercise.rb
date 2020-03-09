# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  date       :date
#  ex_type    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Exercise < ApplicationRecord

belongs_to :user
has_one :cardio, :foreign_key => "ex_id", :dependent => :destroy
has_one :weight, :foreign_key => "ex_id", :dependent => :destroy

end
