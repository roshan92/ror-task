module V1
  class Sales < Grape::API

    resources :sales do
      desc "Return list of all sales"
      get do
        Sale.all
      end
    end
  end
end