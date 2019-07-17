# == Schema Information
#
# Table name: movie_functions
#
#  id         :bigint(8)        not null, primary key
#  movie_id   :bigint(8)
#  date       :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_movie_functions_on_movie_id  (movie_id)
#
# Foreign Keys
#
#  fk_rails_...  (movie_id => movies.id)
#

require 'rails_helper'

RSpec.describe MovieFunction, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
