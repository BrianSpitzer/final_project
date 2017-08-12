class TastesController < ApplicationController
  def index
    @tastes = Taste.all

    render("tastes/index.html.erb")
  end

  def show
    @taste = Taste.find(params[:id])

    render("tastes/show.html.erb")
  end

  def new
    @taste = Taste.new

    render("tastes/new.html.erb")
  end

  def create
    @taste = Taste.new

    @taste.name = params[:name]

    save_status = @taste.save

    if save_status == true
      redirect_to("/tastes/#{@taste.id}", :notice => "Taste created successfully.")
    else
      render("tastes/new.html.erb")
    end
  end

  def edit
    @taste = Taste.find(params[:id])

    render("tastes/edit.html.erb")
  end

  def update
    @taste = Taste.find(params[:id])

    @taste.name = params[:name]

    save_status = @taste.save

    if save_status == true
      redirect_to("/tastes/#{@taste.id}", :notice => "Taste updated successfully.")
    else
      render("tastes/edit.html.erb")
    end
  end

  def destroy
    @taste = Taste.find(params[:id])

    @taste.destroy

    if URI(request.referer).path == "/tastes/#{@taste.id}"
      redirect_to("/", :notice => "Taste deleted.")
    else
      redirect_to(:back, :notice => "Taste deleted.")
    end
  end
end
