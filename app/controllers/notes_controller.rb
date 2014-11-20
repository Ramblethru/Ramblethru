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
    @note = Note.create(note_params)
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
    params.require(:note).permit(:body)
  end
end