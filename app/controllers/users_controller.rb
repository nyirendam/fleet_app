class UsersController < ApplicationController
	
	def index
	    #raise params.to_yaml
		@users = User.find(:all) 
		respond_to do |format| 
			format.html # index.html.erb 
			format.xml { render :xml => @users } 
		end
	end	

	def show
		#raise params.to_yaml
		@user = User.find(params[:id])
		respond_to do |format| 
			format.html # show.html.erb 
			format.xml { render :xml => @user }
		end
	end  

	

	def new
		@user = User.new 
		respond_to do |format| 
			format.html # new.html.erb 
			format.xml { render :xml => @user} 
		end
  	end

	def create
		@user = User.new(params[:user]) 
		respond_to do |format| 
			if @user.save flash[:notice] = 'New user was successfully created.' 
				#raise params.to_yaml
				format.html { redirect_to(@user) } 
				format.xml { render :xml => @user, :status => :created, :location => @user } 
			else 
				#raise params.to_yaml
				format.html { render :action => "new" } 
				format.xml { render :xml => @user.errors, :status => :unprocessable_entity } 
			end 
		end
	end

end
