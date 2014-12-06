class NotesController < ApplicationController
 include Taggable

 def index
   respond_to do |format|
     format.html do
       if params[:search]
         @note = Note.search(params[:search]).order("created_at DESC")
       end
     end
     format.js do
       if params[:search]
         @note = Note.search(params[:search])
         render 'notes/search', status: :created
       else
         render :create, status: :not_found
       end
     end
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
    if @note.update(note_params)
      respond_to do |format|
        format.html { redirect_to @ramble}
        format.json { redirect_to @ramble}
      end
    else
      render :edit
    end
  end

  def edit
    @ramble = Ramble.find(params[:ramble_id])
    @note = @ramble.notes.find(params[:id])
    render 'notes/_edit'
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

  def set_share
    @note = Note.find(params[:id])
    respond_to do |format|
      format.html do
        @note.toggle(:share)
        @note.save
        redirect_to root_path
      end
      format.js do
        @note.toggle(:share)
        @note.save
        render 'notes/set_share', status: :success
      end
    end
  end
 
 private

  def note_params
    params.require(:note).permit(:body, :user_id, :ramble_id, :tag_list, :title, :address, :url, :share)
  end
end
