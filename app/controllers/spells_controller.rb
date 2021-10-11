class SpellsController < ApplicationController
  def index
      @spells = Spell.all
  end

  def create
      @spell = Spell.new(spell_params)
      
      if @spell.save
          flash[:notice] = "Successfully added #{@spell.name} to All Spells"
          redirect_to spells_url
      else
          render :new
      end
  end

  def new
      @spell = Spell.new
  end

  def edit
      @spell = Spell.find(params[:id])
  end

  def show
      @spell = Spell.find(params[:id])
  end

  def update
      @spell = Spell.find(params[:id])  
      if @spell.update(spell_params)
          flash[:notice] = "Successfully updated #{@spell.name}" 
          redirect_to spells_url
      else
          render :edit
      end
      
  end

  def destroy
      @spell = Spell.find(params[:id])  
          if @spell.destroy 
              flash[:notice] = "Successfully deleted #{@spell.name}"
          else
              flash[:notice] = 'Unable to delete spell.'
          end
      
      redirect_to spells_url
  end
  
  def add  
      @spell = Spell.find(params[:id])
  end 
   
  def add_spell
      @spell = Spell.find(params[:id])
      @book = Book.find(params[:book_ids])
      
      if !@book.spells.include?(@spell)
          @spell.books << @book
          flash[:notice] = "Successfully added #{@spell.name} to #{@book.name}"
      else 
          flash[:notice] = 'Unable to add'
      end
      redirect_to spells_url    
  end
    
    private
    # Only allow a trusted parameter "white list" through.
    def spell_params
      # params is a hashtable.  It should have in it a key of :book.
      # The value for the :book key is another hash.
      # If params does not contain the key :book, an exception is raised.  
      # Only the "book" hash is returned and only with the permitted key(s).
      # So returns a hash with only having at most keys of :title, :year, :author_id
      params.require(:spell).permit(:name, :level, :school, :concentration, :description, spellclass_ids: [])
    end
end
