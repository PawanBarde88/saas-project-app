module ApplicationHelper
    def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      next if message.blank?

      type = 'success' if type == 'notice'
      type = 'danger' if type == 'alert'
      text = content_tag(:div, 
        content_tag(:button, '×', class: 'close', 'data-dismiss' => 'alert') +
        message.html_safe, class: "alert alert-#{type} fade in")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end
end
