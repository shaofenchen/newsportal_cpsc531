require 'feedzirra'
class SourcesController < ApplicationController
  # GET /sources
  # GET /sources.json
  def index
    @sources = Source.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sources }
    end
  end

  # GET /sources/1
  # GET /sources/1.json
  def show
    @source = Source.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @source }
    end
  end

  # GET /sources/new
  # GET /sources/new.json
  def new
    @source = Source.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @source }
    end
  end

  # GET /sources/1/edit
  def edit
    @source = Source.find(params[:id])
  end

  # POST /sources
  # POST /sources.json
  def create
    @source = Source.new(params[:source])
    if Source.find_by_source_link(params[:source][:source_link]).nil? then
		feed = Feedzirra::Feed.fetch_and_parse(@source.source_link)
		@source.name = feed.title
		@source.source_type = "rss"
		
		respond_to do |format|
		  if @source.save
			Article.import(@source.source_link)
			format.html { redirect_to @source, notice: 'Source was successfully created.' }
			format.json { render json: @source, status: :created, location: @source }
		  else
			format.html { render action: "new" }
			format.json { render json: @source.errors, status: :unprocessable_entity }
		  end
		end
	else
		respond_to do |format|
			format.html { redirect_to @source, notice: 'Source was successfully created.' }
			format.json { render json: @source, status: :created, location: @source }
		end
	end
  end

  # PUT /sources/1
  # PUT /sources/1.json
  def update
    @source = Source.find(params[:id])

    respond_to do |format|
      if @source.update_attributes(params[:source])
        format.html { redirect_to @source, notice: 'Source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    @source = Source.find(params[:id])
    @source.destroy

    respond_to do |format|
      format.html { redirect_to sources_url }
      format.json { head :no_content }
    end
  end
end
