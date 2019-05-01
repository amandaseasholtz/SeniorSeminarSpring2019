<tr class="nested-fields">
  <td>
    <%= link_to_remove_association "remove Expected", form, class: 'btn btn-primary btn-xs' %>
  </td>
  <td><%= form.input :expense, label: false %></td>
  <td><%= form.input :cost, label: false %></td>
</tr>