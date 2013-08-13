class CountriesController < ApplicationController
  # GET /countries
  # GET /countries.xml
  before_filter :authenticate_user!

  def index
    @countries = Country.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @countries }
    end
  end

  # GET /countries/1
  # GET /countries/1.xml
  def show
    @country = Country.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @country }
    end
  end

  # GET /countries/1/edit
  def edit
    @country = Country.find(params[:id])
  end

  # POST /countries
  # POST /countries.xml
  def create
    @country = Country.new(params[:country])

    respond_to do |format|
      if @country.save
        format.html { redirect_to(@country, :notice => 'Country was successfully created.') }
        format.xml  { render :xml => @country, :status => :created, :location => @country }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /countries/1
  # PUT /countries/1.xml
  def update
    @country = Country.find(params[:id])

    respond_to do |format|
      if @country.update_attributes(params[:country])
          if params[:visit] && (Visit.find(:all, :conditions => {:country_id => params[:id], :user_id => current_user.id})).count == 0
             @country.visits.build(:user_id => current_user.id)
             @country.save
          else
             Visit.delete_all(:user_id => current_user.id, :country_id => params[:id])		
          end

        format.html { redirect_to(@country, :notice => 'Country was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @country.errors, :status => :unprocessable_entity }
      end
    end
  end


  def updatevisits
	
	params[:checkbox_array].each do |checkbox|
           if checkbox[1][1] == "true" && (Visit.find(:all, :conditions => {:country_id => checkbox[1][0], :user_id => current_user.id})).count == 0
               @country = Country.find(checkbox[1][0])
	       @country.visits.build(:user_id => current_user.id)
               @country.save
           elsif checkbox[1][1] == "false" && (Visit.find(:all, :conditions => {:country_id => checkbox[1][0], :user_id => current_user.id})).count > 0
               Visit.delete_all(:user_id => current_user.id, :country_id => checkbox[1][0])		
           end		
		
	end	
	redirect_to :action => "index"
  end 	 

end
