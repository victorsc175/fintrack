namespace :update_stock_price do
  desc "Update stock price"
  task update_stock_price: :environment do
    UpdatePriceJob.perform_later nil
  end
end
