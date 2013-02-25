############### has_one relationship ###################

# parent controller
def new
	@parent = Parent.new
	@parent.build_child
	
	respond_to do |format|
	  format.html # new.html.erb
	  format.json { render json: @parent }
	end
end

def create
    @parent = Parent.new(params[:parent])
    
    respond_to do |format|
      if @parent.save
        format.html { redirect_to @parent, notice: 'parent was successfully created.' }
        format.json { render json: @parent, status: :created, location: @parent }
      else
        format.html { render action: "new" }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

# child controller
def new
	@child = Child.new
	respond_to do |format|
      format.js
    end
end


def create 
	@child = Child.new(params[:child])
    respond_to do |format|
      if @child.save
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @child.errors, status: :unprocessable_entity }
      end
    end
end

# form

form_for(@parent) do |f|
	f.fields_for :child do |builder|
		builder.text_area :comments, rows: 4
	end
end

# routes
resources :parents
resources :childs