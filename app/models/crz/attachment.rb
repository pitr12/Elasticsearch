class Crz::Attachment < Document
  belongs_to :document
  has_many :pages
end
