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
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
