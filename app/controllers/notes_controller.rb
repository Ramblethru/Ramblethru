class NotesController < ApplicationController
   include Taggable

  def index
    @notes = Note.all

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
        else
          redirect_to root_path, alert: "Sorry, you must enter something. Anything at all."
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
    @note.update(note_params)
    redirect_to @notes
  end

  def edit
  end

  def destroy
    @note.destroy
    redirect_to notes_url
  end

  private

  def note_params
    params.require(:note).permit(:body, :user_id, :ramble_id, :tag_list)
  end
end