# ApplicationHelper
module ApplicationHelper
  def elastic_email(email)
    splitted = email.split(/@/)
    splitted.first +
      content_tag(:span) +
      '@' +
      splitted.last
  end
end
