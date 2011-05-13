class MoviesController < ApplicationController
  # GET /movies
  def index
    @movies = Movie.all(:order => :title);

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /movies/1
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to(@movie, :notice => 'Movie was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /movies/1
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to(@movie, :notice => 'Movie was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /movies/1
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to(movies_url) }
    end
  end

  def filter_movies
    allTags = (params[:matchAllTags] == "true")
    movies = Movie.by_genres(params[:genres]).by_tags(params[:tags], allTags)

    render :partial => "movies/movie_viewer",
           :locals => { :movies => movies }
  end
end
