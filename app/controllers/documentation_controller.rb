class DocumentationController < ActionController::Base
  def show
    respond_to do |format|
      format.html {render template: 'documentation/show', :content_type => 'text/html'}
    end
  end
end
