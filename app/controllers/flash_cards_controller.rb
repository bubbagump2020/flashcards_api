class FlashCardsController < ApplicationController

    # Postman tested
    def index
        all_flash_cards = FlashCard.all
        deck_flash_cards = []
        all_flash_cards.map do | flash_card |
            if flash_card.deck_id == params[:deck_id]
                deck_flash_cards.push(flash_card)
            end
        end
        render json: deck_flash_cards
    end

    def create
        flash_card = FlashCard.new(flash_card_params)
        if flash_card.save
            render json: flash_card
        else
            render json: flash_card.errors.full_messages
        end
    end

    def update
        flash_card = FlashCard.find_by_id(params[:id])
        if flash_card.update(flash_card_params)
            render json: flash_card
        else
            render json: flash_card.errors.full_messages
        end
    end

    def destroy
        flash_card = FlashCard.find_by_id(params[:id])
        if flash_card.delete
            render json: "Flash card deleted!"
        else
            render json: flash_card.errors.full_messages
        end
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