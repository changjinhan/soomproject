class SoomCardsController < ApplicationController
    # before_action :authenticate_user!

    def index
        if user_signed_in?
            graph = Koala::Facebook::API.new(current_user.token)
            user = graph.get_object("me")
            @friends = graph.get_connections(user["id"], "friends")
            puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
            puts @friends
            
        end
        render 'index'
    end

    def new
    end


    def create
    end

    def destroy
    end


    def day_list
    end

    def deul_soom
    end

    def nal_soom
    end

    def notice
    end

end
