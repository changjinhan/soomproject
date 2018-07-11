class SoomCardsController < ApplicationController
    def index
        pass
    end

    def new
        render 'new'
    end


    def create
        title = params[:title]
        content = params[:content]
        
        soom_card = SoomCard.new
        soom_card.title = title
        soom_card.content = content
        soom_card.save

        redirect_to action: 'nal_soom'
    end

    def destroy
        pass
    end


    def day_list
        pass
    end

    def deul_soom
        render 'deul_soom'
    end

    def nal_soom
        @soom_cards = SoomCard.all
        render 'nal_soom'
    end

    def notice
    
    end

end
