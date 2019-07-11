class NotesController < ApplicationController
  before_action :set_note, only: %i[show edit update destroy]

  def index
    # flash[:success] = "Welcome #{current_user.name}!"
    @notes = if params[:tag]
               current_user.notes.tagged_with(params[:tag])
             else
               current_user.notes
             end.includes(:tags).order(updated_at: :desc).page(params[:page])
  end

  def show; end

  def new
    @note = current_user.notes.new
  end

  def create
    current_user.notes.create(note_params)
    redirect_to notes_path
  end

  def edit; end

  def update
    @note.update(note_params)

    redirect_to note_path(@note)
  end

  def destroy
    @note.destroy

    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :tag_list, :tag,
                                 { tag_ids: [] }, :tag_ids)
  end

  def set_note
    @note = current_user.notes.find(params[:id])
  end
end
