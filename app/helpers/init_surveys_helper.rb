module InitSurveysHelper
  protected


  # @param message string
  # @param data json
  def render_success_format message, data, simple_array=false
    render_data = simple_array ? data : [data]
    render :json => {
        success: true,
        message: message,
        data: render_data
    }, status: 200
  rescue => e
    raise e
  end

  # @param message string
  def render_destroy_format message
    render :json => {
        success: true,
        message: message
    }, status: 200
  rescue => e
    raise e
  end

  # @param data json
  # @param success boolean
  def render_default_error error, status
    render :json => {
        success: false,
        errors: [ error ]
    }, status: status
  end
end
