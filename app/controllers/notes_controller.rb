class NotesController < ApplicationController

  def index
  end

  def show
  end

  def new
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
