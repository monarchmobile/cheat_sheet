$ rails g model announcement message:text starts_at:datetime ends_at:datetime
$ rails g controller announcements
$ rake db:migrate

<body>
  <% Announcement.all.each do |announcement| %>
    <%= div_for announcement do %>
      <%= announcement.message %>
    <% end %>
  <% end %>
  <!-- Rest of body omitted -->
</body>

<% Announcement.current.each do |announcement| %>
  <%= div_for announcement do %>
    <%= announcement.message %>
  <% end %>
<% end %>

class Announcement < ActiveRecord::Base
  attr_accessible :ends_at, :message, :starts_at
  scope :current, -> { where("starts_at <= :now and ends_at >= :now", now: Time.zone.now) }
end

<% Announcement.current.each do |announcement| %>
  <%= div_for announcement do %>
    <%= announcement.message %>
    <%= link_to "hide announcement", hide_announcement_path(announcement) %>
  <% end %>
<% end %>



class ApplicationController < ActionController::Base
  protect_from_forgery
  def hide
    ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
    cookies.permanent.signed[:hidden_announcement_ids] = ids
    redirect_to :back
  end
end

<% Announcement.current(cookies.signed[:hidden_announcement_ids]).each do |announcement| %>
  <%= div_for announcement do %>
    <%= announcement.message %>
    <%= link_to "hide announcement", hide_announcement_path(announcement) %>
  <% end %>
<% end %>

class Announcement < ActiveRecord::Base
  attr_accessible :ends_at, :message, :starts_at
  
  def self.current(hidden_ids = nil)
    result = where("starts_at <= :now and ends_at >= :now", now: Time.zone.now)
    result = result.where("id not in (?)", hidden_ids) if hidden_ids.present?
    result
  end
end

<%= link_to "hide announcement", hide_announcement_path(announcement), remote: true %>


def hide
  ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
  cookies.permanent.signed[:hidden_announcement_ids] = ids
  respond_to do |format|
    format.html { redirect_to :back }
    format.js
  end
end

$('#announcement_<%= j params[:id] %>').remove();

