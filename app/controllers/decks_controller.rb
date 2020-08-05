class DecksController < ApplicationController

    # Postman tested
    def index
        all_decks = Deck.all
        user_decks = []
        all_decks.map do | deck |
            if deck.user_id == params[:user_id]
                user_decks.push(deck)
            end
        end
        render json: user_decks
    end

    # Postman tested
    def create
        deck = Deck.new(deck_params)
        if deck.save
            render json: deck
        else
            render json: deck.errors.full_messages
        end
    end

    # Postman tested
    def update
        deck = Deck.find_by_id(params[:id])
        if deck.update(deck_params)
            render json: deck
        else
            render json: deck.errors.full_messages
        end
    end

    # Postman tested
    def destroy
        deck = Deck.find_by_id(params[:id])
        if deck.delete
            render json: { message: "Deck destroyed!" }
        else
            render json: deck.errors.full_messages
        end
    end

    private

    def deck_params
        params.require(:deck).permit(
            :user_id,
            :subject
        )
    end
end