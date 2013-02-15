----- index -----
render an object with paramaters
render a pdf
render nothing
render same controller different action
all_types_of_renders
render action from another template
render json
render xml 
render vanilla javascript
previous page visited (referrer page)
render and local variable
find instance refactor 
query in url
----- index ---------

# render an object with paramaters
respond_to do |format|
  format.html { @blogs = Blog.all(:limit => 10) }
  format.any(:atom, :rss) { @blogs = Blog.all }
end

# render a pdf
respond_to do |format|
  format.html
  format.pdf { render :pdf => generate_pdf(@client) }
end

# render nothing
render :nothing => true

# render same controller different action
def update
  @book = Book.find(params[:id])
  if @book.update_attributes(params[:book])
    redirect_to(@book)
  else
    render "edit" # or render :edit
  end
end

	# this is the same
def update
  @book = Book.find(params[:id])
  if @book.update_attributes(params[:book])
    redirect_to(@book)
  else
    render :action => "edit"
  end
end

# all_types_of_renders
render :edit
render :action => :edit
render 'edit'
render 'edit.html.erb'
render :action => 'edit'
render :action => 'edit.html.erb'
render 'books/edit'
render 'books/edit.html.erb'
render :template => 'books/edit'
render :template => 'books/edit.html.erb'
render '/path/to/rails/app/views/books/edit'
render '/path/to/rails/app/views/books/edit.html.erb'
render :file => '/path/to/rails/app/views/books/edit'
render :file => '/path/to/rails/app/views/books/edit.html.erb'

http://localhost:3000/users/1/scrapbooks/day
http://localhost:3000/users/1/scrapbook/day

# render action from another template
render 'products/show'

# render json 
render :json => @product

# xml 
render :xml => @product

# vanilla javascript 
render :js => "alert('Hello Rails');"

# previous page visited (referrer page)
request.env['HTTP_REFERER']

# render and local variable
format.html {  render "images/crop", :locals => {:range => range}  }

# find instance refactor 
class PostsController < ApplicationController
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]

  def update
    @post.update_attributes(params[:post])
  end

  def destroy
    @post.destroy
  end

  protected    
    def find_post
      @post = current_user.posts.find(params[:id])
    end
end

# query in url
# This action uses query string parameters because it gets run
  # by an HTTP GET request, but this does not make any difference
  # to the way in which the parameters are accessed. The URL for
  # this action would look like this in order to list activated
  # clients: /clients?status=activated
  def index
    if params[:status] == "activated"
      @clients = Client.activated
    else
      @clients = Client.unactivated
    end
  end

