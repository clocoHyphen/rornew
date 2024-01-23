class MusicsController < ApplicationController
  # before_action :set_music, only: %i[ index show update destroy ]
  before_action :set_music, only: %i[ update destroy ]
  before_action :authorize_request

  # GET /musics
  # GET /musics.json
  def index
    @musics = Music.all
    render json: @musics
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
    artist_id = params[:id]
    @musics = Music.where(artistId: artist_id)
    render json: @musics
  end

  # POST /musics
  # POST /musics.json
  def create
    puts music_params
    @music = Music.new(music_params)

    if @music.save
      message = "Music added."
      render json:  message, status: :created, location: @music
    else
      render json: @music.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /musics/1
  # PATCH/PUT /musics/1.json
  def update
    if @music.update(music_params)
      message = "Music Updated.."
      render json:  message, status: :created, location: @music
    else
      render json: @music.errors, status: :unprocessable_entity
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    respond_to do |format|
      if @music && @music.destroy!
        notice =  "music was successfully destroyed."
        return render json: notice ,  status: :ok
      else
        return render json: @music.errors, status: :unprocessable_entity
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = Music.find(params[:id])
      unless @music
        message = "No Music Found." 
        render json: message, status: :unprocessable_entity
      end
        
    end

    # Only allow a list of trusted parameters through.
    def music_params
      params.fetch(:music).permit(:album,:title,:genre,:artistId)
    end
end
