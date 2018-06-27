require 'net/smtp'

module EmailHandler
  class Emailer
    def send_mail_on_chef_run(node_name, rcpt, full_text)
      
      message = "From: Chef olign <#{node_name}@#shit.com>\n"
      message << "To: Admin <#{rcpt}>\n"
      message << "Subject: Chef run failed\n"
      message << "Date: #{Time.now.rfc2822}\n\n"
      message << "Chef run failed on #{node_name}\n"
      message << full_text
      Net::SMTP.start('localhost', 25) do |smtp|
        smtp.send_message message, "#{node_name}", "#{rcpt}"
      end

    end
  end
end
