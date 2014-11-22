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
    @note = Note.new(note_params)
    binding.pry
    if @note.save
      redirect_to ramble_path(@note.ramble_id), success: "Your note was recorded."
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
    params.require(:note).permit(:body, :ramble_id)
  end
end