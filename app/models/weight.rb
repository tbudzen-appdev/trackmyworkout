# == Schema Information
#
# Table name: weights
#
#  id         :integer          not null, primary key
#  lift       :string
#  reps       :integer
#  sets       :integer
#  weight     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  ex_id      :integer
#

class Weight < ApplicationRecord


belongs_to :ex, :class_name => "Exercise"
has_one :user, :through => :ex, :source => :user

end
