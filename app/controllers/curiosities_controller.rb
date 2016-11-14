class CuriositiesController< ApplicationController
    def show 
        @curiosity = Curiosity.find(params[:id])
    end
    
    def destroy
        @curiosity = Curiosity.find(params[:id])
        @curiosity.delete
        
        redirect_to home_path
    end
    
    def new
        @curiosity = Curiosity.new
    end
    
    def create
        @curiosity = Curiosity.new(curiosity_params)
        if @curiosity.save
            redirect_to @curiosity
        else
            render 'new'
        end
    end
    
    private
    def curiosity_params
        params.require(:curiosity).permit(:name, :description, :image_url, :image_text)
    end
    
end

