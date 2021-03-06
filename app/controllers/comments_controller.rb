class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @confession = Confession.find(params[:confession_id])
    @comment = @confession.comments.build(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @confession, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @confession }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @confession = @comment.confession

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  def set_cookie
    name = 'comment' + params[:id]
    @comment = Comment.find(params[:id])
  	if !cookies[name].present? or cookies[name] == "0"
  	  if @comment.flags.nil?
  	    @comment.flags = 1
  	  else 
  	    @comment.flags += 1
  	  end
  	  cookies[name] = "1"
  	else
  	  @confession.flags -= 1 
  	  cookies[name] = "0"
    end
    @comment.save
    redirect_to(:root)
  end
end
