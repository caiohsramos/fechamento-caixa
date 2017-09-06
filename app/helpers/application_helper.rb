module ApplicationHelper
  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
      end
  end

  def format_number(num)
    number_to_currency(num, {:unit => 'R$', :separator => ',', :delimiter => '.', :precision => 2})
  end
end
