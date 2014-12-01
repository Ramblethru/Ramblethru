class NotesController < ApplicationController
 include Taggable

  def index
    if params[:tag]
      @notes = Note.tagged_with(params[:tag])
    else
      @notes = Note.all
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    @ramble = Ramble.find(params[:ramble_id])
    @note = @ramble.notes.create(note_params)
    respond_to do |format|
      format.html do
        if @note.save
          redirect_to @ramble, success: "Your note was recorded."
        end
      end
      format.js do
        if @note.save
          render :create, status: :created
        else
          render :create, status: :not_found
        end
      end
    end
  end

  def update
    @ramble = Ramble.find(params[:ramble_id])
    @note = @ramble.notes.find(params[:id])
    @note.update(note_params)
    redirect_to @ramble
  end

  def edit
    @ramble = Ramble.find(params[:ramble_id])
    @note = @ramble.notes.find(params[:id])
  end

  def destroy
    @note = Note.find(params[:id])
    respond_to do |format|
      format.html do
        @note.destroy
        redirect_to root_path
      end
      format.js do
        @note.destroy
        render 'notes/remove', status: :success
      end
    end
  end

 private

  def note_params
    params.require(:note).permit(:body, :user_id, :ramble_id, :tag_list, :title, :address, :url)
  end
end