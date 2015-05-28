<%= form_for [topic,post, post.comments.new] do |f| %>
  <%= f.label :comment %>
  <%= f.text_area :body, class: 'form-control', placeholder: "Enter comment." %>
  <div class="form-group">
    <%= f.submit "Save", class: 'btn btn-success' %>
  </div>
<% end %> 
