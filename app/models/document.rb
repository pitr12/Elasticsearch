class Document < ActiveRecord::Base
has_many :documents_heuristics
has_many :heuristics, :through => :documents_heuristics
end
