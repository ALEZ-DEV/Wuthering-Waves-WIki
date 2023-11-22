class WikiController < ApplicationController
  def index
    @all_pages = Dir["./pages/*_page"]
  end

  def new
  end

  def create
    @title = params[:title].sub(" ", "_")
    @content = params[:content]

    if @title != nil && @content != nil
      File.open(store_dir(filename(@title)), 'w') do |file|
        file.write(@content)
      end
    end

    redirect_to "/wiki"
  end

  def show
    @page_name = params['page_name']

    if  File.exist?(store_dir(filename(@page_name)))
      @page_content = File.read(store_dir(filename(@page_name)))
    else
      render_404
    end

  end

  def filename(page_name)
    page_name + "_page"
  end

  def store_dir(filename)
    "#{Rails.root}/pages/" + filename
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
