class ListingsController < ApplicationController
	before_action :find_listing, only: [:show, :edit, :update]
	
	def index
	  if params[:tag]
	    @listings = Listing.tagged_with(params[:tag])
      else
		@listings = Listing.all
	  end
	end

	def new
	  @listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to listings_path
		end
	end

	def show
	end

	def edit
	end

	def update
		if @listing.update(listing_params)
			flash[:success] = "Successfully updated"
			redirect_to @listing
		else
			flash[:danger] = "Sorry, something went wrong. Try again later."
			render :edit
		end
	end

	def find_listing
		@listing = Listing.find(params[:id])
	end

	def destroy
	end

	def listing_params
		params.require(:listing).permit(:title, :description, :address, :max_guests, :price, :tag_list)
    end

end
