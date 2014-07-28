class Heuristic < ActiveRecord::Base
  has_many :documents_heuristics
  has_many :documents, :through => :documents_heuristics
end
