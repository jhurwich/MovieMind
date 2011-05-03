class MovieTagsController < ApplicationController
  # GET /movie_tags
  # GET /movie_tags.xml
  def index
    @movie_tags = MovieTag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movie_tags }
    end
  end

  # GET /movie_tags/1
  # GET /movie_tags/1.xml
  def show
    @movie_tag = MovieTag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movie_tag }
    end
  end

  # GET /movie_tags/new
  # GET /movie_tags/new.xml
  def new
    @movie_tag = MovieTag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movie_tag }
    end
  end

  # GET /movie_tags/1/edit
  def edit
    @movie_tag = MovieTag.find(params[:id])
  end

  # POST /movie_tags
  # POST /movie_tags.xml
  def create
    @movie_tag = MovieTag.new(params[:movie_tag])

    respond_to do |format|
      if @movie_tag.save
        format.html { redirect_to(@movie_tag, :notice => 'MovieTag was successfully created.') }
        format.xml  { render :xml => @movie_tag, :status => :created, :location => @movie_tag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movie_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movie_tags/1
  # PUT /movie_tags/1.xml
  def update
    @movie_tag = MovieTag.find(params[:id])

    respond_to do |format|
      if @movie_tag.update_attributes(params[:movie_tag])
        format.html { redirect_to(@movie_tag, :notice => 'MovieTag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movie_tag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_tags/1
  # DELETE /movie_tags/1.xml
  def destroy
    @movie_tag = MovieTag.find(params[:id])
    @movie_tag.destroy

    respond_to do |format|
      format.html { redirect_to(movie_tags_url) }
      format.xml  { head :ok }
    end
  end
end
