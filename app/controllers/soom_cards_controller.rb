class SoomCardsController < ApplicationController
    before_action :authenticate_user!
    # before_action 뒤의 옵션들
    # only: [ :new, :create, :destroy, :day_list, :pop_card] 이런식으로 특정 액션만 로그인 제한둘 수 있음.
    # except: [ :index] 반대로 이렇게 특정 액션은 로그인 없이 허용할 수도 있음.
    
    def index
        if !user_signed_in?
            redirect_to "users/sign_in"
        end
        render 'index'
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
