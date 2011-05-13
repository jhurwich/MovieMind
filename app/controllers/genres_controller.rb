class GenresController < ApplicationController
  # GET /genres
  def index
    @genres = Genre.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /genres/new
  def new
    @genre = Genre.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /genres
  def create
    @genre = Genre.new(params[:genre])

    respond_to do |format|
      if @genre.save
        format.html { redirect_to(@genre, :notice => 'Genre was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /genres/1
  def update
    @genre = Genre.find(params[:id])

    respond_to do |format|
      if @genre.update_attributes(params[:genre])
        format.html { redirect_to(@genre, :notice => 'Genre was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /genres/1
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy

    respond_to do |format|
      format.html { redirect_to(genres_url) }
    end
  end
end
