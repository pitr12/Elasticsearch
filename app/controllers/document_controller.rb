class DocumentController < ApplicationController
  def index
    query = {
        query: {
            query_string: {
                query: params[:q]
            }
        },
        facets: {
            Customers: {
              terms: {
                  field: 'customer.raw'
              }
            },
            by_day: {
                date_histogram: {
                    field: :date,
                    interval: :day,
                }
            },
            by_price: {
              range: {
                  field: :price,
                  ranges: [
                      {from: 0, to: 100},
                      {from: 100, to: 500},
                      {from: 500, to: 2000},
                      {from: 2000, to: 5000},
                      {from: 5000}
                  ]
              }
            }
        }
    }

    @results = JSON.parse(Faraday.post('http://localhost:9200/oz/documents/_search', query.to_json).body)
  end
end