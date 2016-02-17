#
#
#

layout_header

p_title varchar
p_page varchar

<?

?><%

%><!DOCTYPE html>
<html>
<head>
    <% if p_title != '' then %>
    <title><%= p_title %></title>
    <% end if; %>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

    <style>

    svg {
        height: 50px;
        width: 50px;
    }

    td span {
		display: block;
		text-align: center;
    }

    </style>

</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <span class="navbar-brand">Customer Support</span>
    </div>
    <ul class="nav navbar-nav">
      <li<% if p_page = 'graph' then %> class="active"<% end if; %>><a href="/">Chart</a></li>
      <li<% if p_page = 'list' then %> class="active"<% end if; %>><a href="report_issue_list">List View</a></li>
    </ul>
  </div>
</nav>