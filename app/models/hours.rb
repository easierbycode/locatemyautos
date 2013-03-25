class Hours < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_protected :created_at
end
