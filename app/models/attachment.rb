class Attachment < ActiveRecord::Base
  belongs_to :document
  has_many :pages
end
