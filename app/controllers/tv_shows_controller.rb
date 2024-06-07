class TvShowsController < ApplicationController
    def index
        if params[:search]
            @tv_shows = Show.search(params[:search]).order("created_at DESC")
        else
            @tv_shows = Show.all.order('created_at DESC')
        end
    end

    def add_to_favourites
        if user_signed_in?
            # puts params[:show_id]
            # @favshow = Favourite.where('show_id= ?',params[:show_id]).where('user_id = ?',current_user.id).first
            @favshow = Favourite.where(show_id: params[:show_id],user_id: current_user.id).first
            if !@favshow 
                @favourite = Favourite.new(:show_id => params[:show_id],:user_id => current_user.id)
                if @favourite.save
                    render :json => { "message" => "Show added in favourites","success" => true }
                else
                    render :json => { "message" => "Please Try Again.","success" => false }
                end
            else
                @favshow.destroy
                render :json => { "message" => "removed","success" => false }
            end
        else
            render :json => { "message" => "login","success" => false }
        end
    end

    def remove_from_favorites
        if user_signed_in?
            # @favshow = Favourite.where('show_id = ?',params[:show_id]).where('user_id = ?',current_user.id).first
            @favshow = Favourite.where(show_id: params[:show_id],user_id: current_user.id).first
            if @favshow
                @favshow.destroy
                redirect_to "/tv_shows", status: :see_other
            end
        else
            redirect_to '/users/sign_in'
        end
    end
end
