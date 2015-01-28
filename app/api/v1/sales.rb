module V1
  class Sales < Grape::API

    resources :sales do
      #List all sales
      desc "Return list of all sales"
      get do
        Sale.all
      end

      #Get a specific sale (first)
      desc "First sale"
      get :first do
        Sale.first
      end

      #Create a sale
      desc "Create a sale"
      params do
        requires :date, type: String, desc: "Sale date"
        requires :time, type: String, desc: "Sale time"
        requires :code, type: String, desc: "Sale code"
        requires :value, type: String, desc: "Sale value"
      end

      post do
        Sale.create!({
          date: "#{params[:date]} #{params[:time]}",
          code: params[:code],
          value: params[:value].to_d
        })
      end

      #Delete a sale
      desc "Delete a sale"
      params do
        requires :id, type: Integer, desc: "Sale ID"
      end

      delete ':id' do
        Sale.find(params[:id]).destroy!
      end

    end
  end
end