$ ->
	$("#role_user_tokens").tokenInput("/users.json", {
    crossDomain: false,
    prePopulate: $("#role_user_tokens").data("pre"),
    preventDuplicates: true
  })

  $("#role_section_tokens").tokenInput("/sections.json", {
    crossDomain: false
    prePopulate: $("#role_section_tokens").data("pre")
    preventDuplicates: true
  })

  $("#role_group_tokens").tokenInput("/groups.json", {
    crossDomain: false
    prePopulate: $("#role_group_tokens").data("pre")
    preventDuplicates: true
  })

  $("#role_festival_tokens").tokenInput("/festivals.json", {
    crossDomain: false
    prePopulate: $("#role_festival_tokens").data("pre")
    preventDuplicates: true
  })

  $("#position_group_tokens").tokenInput("/groups.json", {
    crossDomain: false
    prePopulate: $("#position_group_tokens").data("pre")
    preventDuplicates: true
  })

  $("#position_user_tokens").tokenInput("/users.json", {
    crossDomain: false
    prePopulate: $("#position_user_tokens").data("pre")
    preventDuplicates: true
  })
