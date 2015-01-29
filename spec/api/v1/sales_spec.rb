require 'rails_helper'

module V1
  describe Sales do
    include Rack::Test::Methods

    def app
      Sales
    end

    describe Sales do
      describe "POST /v1/sales" do
        it "creates a sale" do
          sale = Sale.create! :date => Date.parse('20140103'), :code => 'FL', :value => 2.00
          sales = Sale.find(sale.id)
          post "/v1/sales"
          expect(sales.date).to eq(Date.parse('20140103'))
          expect(sales.code).to eq('FL')
          expect(sales.value).to eq(2.00)
        end
      end

      describe "GET /v1/sales/:id" do
        it "get a specific sale by id" do
          sale = Sale.create!
          get "/v1/sales/#{sale.id}"
          expect(sale.id).to eq(sale.id)
        end
      end

      describe "DELETE /v1/sales/:id" do
        it "delete a specific sale by id" do
          sale = Sale.create!
          delete "/v1/sales/#{sale.id}"
          expect(last_response.status).to eq 404
        end
      end
    end
  end
end


