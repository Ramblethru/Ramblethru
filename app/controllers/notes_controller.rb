class NotesController < ApplicationController

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
    if @note.save
      redirect_to @ramble, success: "Your note was recorded."
    else
      redirect_to root_path, alert: "Sorry, you must enter something.  Anything at all."
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
    params.require(:note).permit(:body, :user_id, :ramble_id)
  end
end