class Vote < ActiveRecord::Base
  belongs_to :card, :counter_cache => true

# rest of your code here
end
