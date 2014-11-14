class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def show
    remder :edit
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new note_params
    if @note.save
      flash.now[:notice] = t('note.flash.create.success')
    else
      flash.now[:alert] = t('note.flash.create.failure')
    end
    render :edit
  end

  def destroy
  end

  def update
    if @note.update note_params
      flash.now[:notice] = t('note.flash.update.success')
    else
      flash.now[:alert] = t('note.flash.update.failure')
    end
    render :edit
  end

  private ##########################################################################################

  def note_params
    params.require(:note).permit(:title, :body_html)
  end

  def find_note
    @note = Note.find params[:id]
  end

end
