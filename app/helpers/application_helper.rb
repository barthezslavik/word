module ApplicationHelper
  def color(article)
    case article
    when /^Der/ then 'style="color: red;"'
    when /^Die/ then 'style="color: #004dff"'
    when /^Das/ then 'style="color: green;"'
    end
  end
end
