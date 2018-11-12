module ApplicationHelper
  def custom_bootstrap_flash
    flash_messages = []
    flash.each_with_index do |(type, message), i|
      type = 'success' if type == 'notice'
      type = 'error'   if type == 'alert'
      text = "<script data-type='flash_message'>
                $.toast({
                  heading: '#{type}',
                  text: '#{message}',
                  icon: '#{type}'
                });
              </script>"
      flash_messages << text.html_safe if message
    end
    flash_messages.join("\n").html_safe
  end
end
