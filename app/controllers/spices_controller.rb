class SpicesController < ApplicationController

    # GET/spices
    def index 
        spices = Spice.all
        render json: spices
    end

    #POST/spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: 201
    end

    #PATCH/spices/:id
    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice
    end

    #DELETE /spices/:id
    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end



    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    #we could use this method below to clean or code with update method,
    #we could need to write spice = Spice.find_spice to make it work
    # but for the purpose of passing this lab is not needed.
    # def find_spice
    #     Spice.find_by(id: params[:id])
    # end


    




end
