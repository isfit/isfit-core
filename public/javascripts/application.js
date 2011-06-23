// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $("#role_user_tokens").tokenInput("/users.json", {
    crossDomain: false,
    prePopulate: $("#role_user_tokens").data("pre"),
    preventDuplicates: true
  });
});
$(function() {
  $("#role_section_tokens").tokenInput("/sections.json", {
    crossDomain: false,
    prePopulate: $("#role_section_tokens").data("pre"),
    preventDuplicates: true
  });
});
$(function() {
  $("#role_group_tokens").tokenInput("/groups.json", {
    crossDomain: false,
    prePopulate: $("#role_group_tokens").data("pre"),
    preventDuplicates: true
  });
});
$(function() {
  $("#role_festival_tokens").tokenInput("/festivals.json", {
    crossDomain: false,
    prePopulate: $("#role_festival_tokens").data("pre"),
    preventDuplicates: true
  });
});
$(function() {
  $("#position_group_tokens").tokenInput("/groups.json", {
    crossDomain: false,
    prePopulate: $("#position_group_tokens").data("pre"),
    preventDuplicates: true
  });
});
$(function() {
  $("#position_user_tokens").tokenInput("/users.json", {
    crossDomain: false,
    prePopulate: $("#position_user_tokens").data("pre"),
    preventDuplicates: true
  });
});
