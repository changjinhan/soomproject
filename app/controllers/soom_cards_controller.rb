class SoomCardsController < ApplicationController
    def index
    end

    def new
        render 'new'
    end


    def create
        redirect_to action: 'day_list'
    end

    def destroy
        redirect_to action: 'day_list'
    end

    def day_list
        datetime = params[:datetime]
        day_card = SoomCard.where(datetime: datetime)
        
        #뷰에 표시할 것들 (프로필사진,이름 추가하기)
        @category = day_card.category
        @hashtag = day_card.hashtag
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
