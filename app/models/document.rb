class Document < ActiveRecord::Base
has_many :documents_heuristics
has_many :heuristics, :through => :documents_heuristics
has_one :crz_document_detail
has_many :attachments

def to_indexable
  {
  customer: crz_document_detail.customer,
  content: attachments.map {|a| a.pages.map(&:text) }.flatten.join(' '),
  supplier: crz_document_detail.supplier,
  price: (crz_document_detail.contracted_amount).to_f,
  date: (crz_document_detail.published_on).to_date
  }
end


end
