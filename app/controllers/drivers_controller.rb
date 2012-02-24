class DriversController < ApplicationController
  
	before_filter :find_driver, :only => [:show, :edit, :update, :destroy] 
 	
	def index
	#raise params.to_yaml
		@drivers = Driver.find(:all) 
		respond_to do |format| 
			format.html # index.html.erb 
			format.xml { render :xml => @drivers } 
		end
  	end

  	def new
		@driver = Driver.new 
		respond_to do |format| 
			format.html # new.html.erb 
			format.xml { render :xml => @driver } 
		end
  	end

	def create
		@driver = Driver.new(params[:driver]) 
		respond_to do |format| 
			if @driver.save flash[:notice] = 'Driver was successfully created.' 
				format.html { redirect_to(@driver) } 
				format.xml { render :xml => @driver, :status => :created, :location => @driver } 
			else 
				format.html { render :action => "new" } 
				format.xml { render :xml => @driver.errors, :status => :unprocessable_entity } 
			end 
		end
	end

  	def edit
		#using a filter method find_driver
  	end

  	def show
		respond_to do |format| 
			format.html # show.html.erb 
			format.xml { render :xml => @driver } 
		end
  	end
	
	def update 
		respond_to do |format| 
			if @driver.update_attributes(params[:driver]) 
				flash[:notice] = 'Driver details have successfully been updated.' 
				format.html { redirect_to(@driver) } 
				format.xml { head :ok } 
			else 
				format.html { render :action => "edit" } 
				format.xml { render :xml => @driver.errors, :status => :unprocessable_entity } 
			end 
		end
	end

	def destroy
		@driver.destroy 
		respond_to do |format| 
			format.html { redirect_to(drivers_url) } 
			format.xml { head :ok } 
		end
	end

	private 
	def find_driver 
		@driver = Driver.find(params[:id]) 
	end

end
