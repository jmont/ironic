class ConfessionsController < ApplicationController
  # GET /confessions
  # GET /confessions.json
  #def index
  #  @confessions = Confession.all
  #
  #  respond_to do |format|
  #    format.html # index.html.erb
  #    format.json { render json: @confessions }
  #  end
  #end

  # GET /confessions/1
  # GET /confessions/1.json
  def show
    if params[:id] != 'undefined'
      @confession = Confession.find(params[:id])
      @comments = @confession.comments

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @confession.to_json(:include => :comments) }
      end
    end
  end

  # GET /confessions/new
  # GET /confessions/new.json
  def new
    @confession = Confession.new
 
    if !(@confession.txt.blank?)
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @confession }
      end
    end
  end

  # GET /confessions/1/edit
  def edit
    @confession = Confession.find(params[:id])
  end

  # POST /confessions
  # POST /confessions.json
  def create
    @confession = Confession.new(params[:confession])

    respond_to do |format|
      if @confession.save and !(@confession.txt.blank?)
        format.html { redirect_to @confession, notice: 'Confession was successfully created.' }
        format.json { render json: @confession, status: :created, location: @confession }
      else
        format.html { render action: "new" }
        format.json { render json: @confession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /confessions/1
  # PUT /confessions/1.json
  def update
    @confession = Confession.find(params[:id])

    respond_to do |format|
      if @confession.update_attributes(params[:confession])
        format.html { redirect_to @confession, notice: 'Confession was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @confession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /confessions/1
  # DELETE /confessions/1.json
  def destroy
    @confession = Confession.find(params[:id])
    @confession.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
  
  def set_cookie
    name = 'confession' + params[:confession_id]
    @confession = Confession.find(params[:confession_id])
  	if !cookies[name].present? or cookies[name] == "0"
  	  if @confession.flags.nil?
  	    @confession.flags = 1
  	  else 
  	    @confession.flags += 1
  	  end
  	  cookies[name] = "1"
  	else
  	  @confession.flags -= 1 
  	  cookies[name] = "0"
    end
    @confession.save
    redirect_to(:root)
  end
  
end
