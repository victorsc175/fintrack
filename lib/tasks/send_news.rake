namespace :send_news do
  desc "Send News"
  task send_news: :environment do
    SendNewsJob.perform_later nil
  end
end
