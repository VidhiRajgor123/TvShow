namespace :bulk do
  desc "TODO"
  task send_emails: :environment do

    # get all the shows will be start after 30 minutes from current time (utf)
    @shows = Show.where(start_time: 30.minutes.from_now.beginning_of_minute)
    p @shows
    @shows.each do |show|
      # get user wise fav show
      @favshows = Favourite.where(show_id:show.id)
      @favshows.each do |favshow|
        user = User.where(id:favshow.user_id).first
        ShowEmailMailer.notification(user, show).deliver_now
      end
    end
    puts "done."
  end

end
