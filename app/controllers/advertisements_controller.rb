class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create

        @advertisement = Advertisement.new
        @advertisement.title = params[:advertisement][:title]
        @advertisement.copy = params[:advertisement][:copy]
        @advertisement.price = params[:advertisement][:price]


        if @advertisement.save
          flash[:notice] = "Ads was saved."
          redirect_to @advertisement
        else
          flash.now[:error] = "There was an error saving the ads. Please try again."
          render :new
        end
      end
    end