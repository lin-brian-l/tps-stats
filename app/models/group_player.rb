class GroupPlayer < ApplicationRecord
  belongs_to :group
  belongs_to :player 
end
