class ApplicationController < ActionController::Base
  def page_not_found
    respond_to do |format|
      format.html { render template: "errors/page_not_found", status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
end
