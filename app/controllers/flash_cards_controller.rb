class FlashCardsController < ApplicationController
    def index
        flash_cards = FlashCards.all
        render json: flash_cards
    end

    private

    def flash_card_params
        params.require(:flash_card).permit(
            :deck_id,
            :title,
            :content
        )
    end
end