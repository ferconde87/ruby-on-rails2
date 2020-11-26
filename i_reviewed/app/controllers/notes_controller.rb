class NotesController < ApplicationController
  before_action :set_book, only: [:create, :destroy]
  
  # POST /books/{book_id}/notes
  # POST /books/{book_id}/notes.json
  def create
    @note = @book.notes.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @book, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { redirect_to @book, alert: 'Unable to add note!' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/{book_id}/notes/{note_id}
  # DELETE /books/{book_id}/notes/{note_id}.json
  def destroy
      @note = @book.notes.find(params[:id])
      @note.destroy
      respond_to do |format|
      format.html { redirect_to  @book, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
      end
  end

  private 
    def set_book
      @book = Book.find(params[:book_id])
    end
    
    def note_params
      params:require(:note).permit(:title, :note)
    end
end
