namespace :util do

  task :fake_timeline => :environment do
    1.upto(42).each do |i|
      SmartValidatorDb::TimelineConflict.create!(
        count: (40 + rand(7)),
        check_date: Time.now - rand(120).minutes
      )
    end
  end

end