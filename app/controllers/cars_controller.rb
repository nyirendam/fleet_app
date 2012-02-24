class CarsController < ApplicationController

	before_filter :find_car, :only => [:show, :edit, :update, :destroy] 
 	
	def index
	#raise params.to_yaml
		@cars = Car.find(:all) 
		respond_to do |format| 
			format.html # index.html.erb 
			format.xml { render :xml => @cars } 
		end
  	end

  	def new
		@car = Car.new 
		respond_to do |format| 
			format.html # new.html.erb 
			format.xml { render :xml => @car } 
		end
  	end

	def create
		@car = Car.new(params[:car]) 
		respond_to do |format| 
			if @car.save flash[:notice] = 'Car was successfully created.' 
				format.html { redirect_to(@car) } 
				format.xml { render :xml => @car, :status => :created, :location => @car } 
			else 
				format.html { render :action => "new" } 
				format.xml { render :xml => @car.errors, :status => :unprocessable_entity } 
			end 
		end
	end

  	def edit
		#using a filter method find_car
  	end

  	def show
		respond_to do |format| 
			format.html # show.html.erb 
			format.xml { render :xml => @car } 
		end
  	end
	
	def update 
		respond_to do |format| 
			if @car.update_attributes(params[:car]) 
				flash[:notice] = 'Car details have successfully been updated.' 
				format.html { redirect_to(@car) } 
				format.xml { head :ok } 
			else 
				format.html { render :action => "edit" } 
				format.xml { render :xml => @car.errors, :status => :unprocessable_entity } 
			end 
		end
	end

	def destroy
		@car.destroy 
		respond_to do |format| 
			format.html { redirect_to(cars_url) } 
			format.xml { head :ok } 
		end
	end

	private 
	def find_car 
		@car = Car.find(params[:id]) 
	end

end
