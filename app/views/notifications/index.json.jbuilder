json.array! @notifications do |notification|
  json.id notification.id
  json.actor notification.actor.email
  json.action notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  end
  json.url project_path(notification.notifiable.project, anchor: dom_id(notification.notifiable))
end
