# == Schema Information
#
# Table name: movie_functions
#
#  id         :bigint           not null, primary key
#  movie_id   :bigint
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe MovieFunction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
