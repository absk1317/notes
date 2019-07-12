class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    @notes = current_user.notes
                         .tagged_with(params[:tag])
                         .includes(:tags)
                         .order(updated_at: :desc)
                         .page(params[:page])
  end

  def show; end

  def new
    @note = current_user.notes.new
  end

  def create
    @note = current_user.notes.build(note_params)
    @note.tag_list = params.require(:note)[:tag_ids].reject(&:blank?)
    if @note.save
      redirect_to note_path(@note)
    else
      flash[:error] = @note.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
    @note.assign_attributes(note_params)
    @note.tag_list = params.require(:note)[:tag_ids].reject(&:blank?)
    if @note.save
      redirect_to note_path(@note)
    else
      flash[:error] = @note.errors.full_messages
      render :edit
    end
  end

  def destroy
    @note.destroy

    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def set_note
    @note = current_user.notes.find(params[:id])
  end
end
