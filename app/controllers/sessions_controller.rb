class SessionsController < ApplicationController
    def new
        
    end

    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
 
        if user
            login!(user)
            print "IT HIT THIS"
            redirect_to users_url
        else
            flash.now[:error] = 'Invalid credentials.'
            render :new
        end
    end

    def destroy
        
    end

end
