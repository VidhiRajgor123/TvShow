class ShowEmailMailer < ApplicationMailer
    default from: "ingennext@gmail.com"
    def notification(user, show)
        @user = user
        @show = show
        mail(to: @user.email, subject: 'Show reminder')
    end
end