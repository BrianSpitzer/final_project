class TechniquesController < ApplicationController
  def index
    @techniques = Technique.all

    render("techniques/index.html.erb")
  end

  def show
    @technique = Technique.find(params[:id])

    render("techniques/show.html.erb")
  end

  def new
    @technique = Technique.new

    render("techniques/new.html.erb")
  end

  def create
    @technique = Technique.new

    @technique.name = params[:name]

    save_status = @technique.save

    if save_status == true
      redirect_to("/techniques/#{@technique.id}", :notice => "Technique created successfully.")
    else
      render("techniques/new.html.erb")
    end
  end

  def edit
    @technique = Technique.find(params[:id])

    render("techniques/edit.html.erb")
  end

  def update
    @technique = Technique.find(params[:id])

    @technique.name = params[:name]

    save_status = @technique.save

    if save_status == true
      redirect_to("/techniques/#{@technique.id}", :notice => "Technique updated successfully.")
    else
      render("techniques/edit.html.erb")
    end
  end

  def destroy
    @technique = Technique.find(params[:id])

    @technique.destroy

    if URI(request.referer).path == "/techniques/#{@technique.id}"
      redirect_to("/", :notice => "Technique deleted.")
    else
      redirect_to(:back, :notice => "Technique deleted.")
    end
  end
end
