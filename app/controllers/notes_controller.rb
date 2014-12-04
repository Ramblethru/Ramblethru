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


  # def note create needs to have the user_id passed to it, darnit
  #   if current_user
  #     @user = current_user
  #     @ramble = Ramble.find(params[:ramble_id])
  #     @note = current_user.rambles.notes.create(note_params)
  #     respond_to do |format|
  #       format.html do
  #         if @note.save
  #           redirect_to @ramble, success: "Your note was recorded."
  #         end
  #       end
  #       format.js do
  #         if @note.save
  #           render :create, status: :created
  #         else
  #           render :create, status: :not_found
  #         end
  #       end
  #     end
  #   else
  #     flash.now[:notice] = "You must be logged in to create a note."
  #   end
  # end


 # def ramble create
 #   if current_user
 #     @user = current_user
 #     @ramble = current_user.rambles.build(ramble_params)
 #     @ramble.save!
 #     RambleMailer.ramble_created(@ramble.user, @ramble).deliver
 #     redirect_to ramble_path(@ramble)
 #   else
 #     render 'logins/new'
 #     flash.now[:notice] = "You must be logged in to create a ramble."
 #   end
 # end


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
