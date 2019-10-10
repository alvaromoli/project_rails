module PostulationsHelper
  def status_color(status)
    case status
    when 'lead'
      'badge-primary'
    when 'contact'
      'badge-danger'
    end
  end
end
