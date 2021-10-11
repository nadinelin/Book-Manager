 class BooksController < ApplicationController
  def index
      @books = Book.all
  end

  def create
      @book = Book.new(book_params)
      
      if @book.save
          flash[:notice] = "Successfully added #{@book.name} to All book"
          redirect_to books_url
      else
#           flash[:notice] = 'unable to add book'
          render :new
      end
  end

  def new
      @book = Book.new
  end

  def edit
      @book = Book.find(params[:id])
  end

  def show
      @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])  
      if @book.update(book_params)
          flash[:notice] = "#{@book.name} was successfully updated " 
          redirect_to @book
      else
          render :edit
      end
  end

  def destroy
    @book = Book.find(params[:id])  
        if @book.destroy
            flash[:notice] = "#{@book.name} was successfully deleted."
        else
            flash[:notice] = "Unable to delete #{@book.name}."
        end
      
        redirect_to books_url 
  end
  
  def delete_spell
      @book = Book.find(params[:id])
      @spell = Spell.find(params[:spell])
      
      if @book = @book.spells.delete(@spell)
          flash[:notice] = "#{@spell.name} successfully removed"
      else
          flash[:notice] = "unable to remove #{@spell.name}"
      end
      redirect_to book_url
  end  
    
  def add_spell_book
      @book = Book.find(params[:id])
      @spell = Spell.find(params[:spell_id])
      
      if !@book.spells.include?(@spell)
         @book.spells << @spell
         flash[:notice] = "#{@spell.name} was added successfully to #{@book.name}"
      else 
         flash[:notice] = "Unable to add #{@spell.name} to #{@book.name}"
      end
      
      redirect_to book_url
  end 
    
  private
    # Only allow a trusted parameter "white list" through.
    def book_params
      # params is a hashtable.  It should have in it a key of :book.
      # The value for the :book key is another hash.
      # If params does not contain the key :book, an exception is raised.  
      # Only the "book" hash is returned and only with the permitted key(s).
      # So returns a hash with only having at most keys of :title, :year, :author_id
      params.require(:book).permit(:name)
    end
    
end
