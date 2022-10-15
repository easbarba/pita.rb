class StoriesController < ApplicationController
  before_action :set_story, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[create update edit new destroy]

  # GET /stories or /stories.json
  def index
    current_page = (params[:page] || 0).to_i

    @stories = Story.downroad.all.page(current_page).per 4
  end

  # GET /stories/1 or /stories/1.json
  def show
  end

  # GET /stories/new
  def new
    @story = current_user.stories.new
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories or /stories.json
  def create
    @story = current_user.stories.build story_params

    respond_to do |format|
      if @story.save
        format.html do
          redirect_to story_url(@story),
                      notice: "Story was successfully created."
        end
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @story.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /stories/1 or /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html do
          redirect_to story_url(@story),
                      notice: "Story was successfully updated."
        end
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @story.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /stories/1 or /stories/1.json
  def destroy
    @story.destroy

    respond_to do |format|
      format.html do
        redirect_to stories_url, notice: "Story was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = Story.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def story_params
    params.require(:story).permit(:body, :title, :published_at, :user_id)
  end
end
