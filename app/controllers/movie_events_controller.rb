class MovieEventsController < ApplicationController
  # GET /movie_events
  # GET /movie_events.xml
  def index
    @movie_events = MovieEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movie_events }
    end
  end

  # GET /movie_events/1
  # GET /movie_events/1.xml
  def show
    @movie_event = MovieEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movie_event }
    end
  end

  # GET /movie_events/new
  # GET /movie_events/new.xml
  def new
    @movie_event = MovieEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @movie_event }
    end
  end

  # GET /movie_events/1/edit
  def edit
    @movie_event = MovieEvent.find(params[:id])
  end

  # POST /movie_events
  # POST /movie_events.xml
  def create
    @movie_event = MovieEvent.new(params[:movie_event])

    respond_to do |format|
      if @movie_event.save
        format.html { redirect_to(@movie_event, :notice => 'MovieEvent was successfully created.') }
        format.xml  { render :xml => @movie_event, :status => :created, :location => @movie_event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @movie_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movie_events/1
  # PUT /movie_events/1.xml
  def update
    @movie_event = MovieEvent.find(params[:id])

    respond_to do |format|
      if @movie_event.update_attributes(params[:movie_event])
        format.html { redirect_to(@movie_event, :notice => 'MovieEvent was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @movie_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_events/1
  # DELETE /movie_events/1.xml
  def destroy
    @movie_event = MovieEvent.find(params[:id])
    @movie_event.destroy

    respond_to do |format|
      format.html { redirect_to(movie_events_url) }
      format.xml  { head :ok }
    end
  end
end
