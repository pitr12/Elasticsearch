class DocumentsHeuristic < ActiveRecord::Base
  belongs_to :heuristic
  belongs_to :document
end
