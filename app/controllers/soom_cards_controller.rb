class SoomCardsController < ApplicationController
    before_action :authenticate_user!
    # before_action 뒤의 옵션들
    # only: [ :new, :create, :destroy, :day_list, :pop_card] 이런식으로 특정 액션만 로그인 제한둘 수 있음.
    # except: [ :index] 반대로 이렇게 특정 액션은 로그인 없이 허용할 수도 있음.
    @@friend_list = []
    def index
        if !user_signed_in?
            redirect_to "users/sign_in"
        else
            graph = Koala::Facebook::API.new(current_user.token)
            user = graph.get_object("me")
            @friends = graph.get_connections(user["id"], "friends")
            puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
            puts @friends
            @friends.each do |f|
                @@friend_list.append(f["name"])
            end
        end
        
        render 'index'
    end

    def new
        render 'new'
    end

    def create
        datetime = params[:datetime]
        friend_name = params[:name]
        category = params[:category]
        hashtag = params[:hashtag]
        memo = params[:memo]

        soomcard = SoomCard.new
        soomcard.image = User.where(name: friend_name).take.image #todo: 동명이인이 있을 때 버그가 생길 수 있음.
        soomcard.friend_name = friend_name
        soomcard.datetime = datetime
        soomcard.category = category
        soomcard.hashtag = hashtag
        soomcard.memo = memo
        soomcard.user_id = current_user.id
        soomcard.save

        redirect_to action: 'index'
    end

    def destroy
        soomcard_id = params[:id]
        SoomCard.destroy(soomcard_id)
        redirect_to action: 'index'
    end

    def day_list
        datetime = params[:datetime]
        @day_card = SoomCard.where(user_id: current_user.id, datetime: datetime)
    end

    def pop_card
        pop_card = SoomCard.find(params[:id])
    end

    def self_soom
    end

    def deul_soom
    end

    def nal_soom
    end

    def notice
    end

end
