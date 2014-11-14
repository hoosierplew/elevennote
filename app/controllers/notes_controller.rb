class NotesController < ApplicationController
  before_action :authorize_user
  before_action :find_note, only: [:edit, :update, :destroy]

  def show
    remder :edit
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new note_params
    set_flash_for( @note.save )
    render_or_redirect
  end

  def destroy
    set_flash_for @note.destroy
    redirect_to new_note_path
  end

  def update
    set_flash_for @note.update( note_params )
    render_or_redirect
  end

  private ##########################################################################################

  def note_params
    params.require(:note).permit(:title, :body_html)
  end

  def find_note
    @note = Note.find params[:id]
  end

  def set_flash_for(action_result)
    if action_result
      flash.now[:notice] = t("note.flash.#{action_name}.success")
    else
      flash.now[:alert] = t("note.flash.#{action_name}.failure")
    end
  end

  def render_or_redirect
    @note.errors.any? ? render :edit : redirect_to @note
  end
end
