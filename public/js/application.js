$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.upvote_form').submit(function(event){
    event.preventDefault();
    debugger;
    $.ajax({
      method: "POST",
      url: "/votes",
      data: $(event.target.children).each(function(index, el) {el.name; el.value})
    }).done(function(response){
      // debugger;
      alert("working")
      // $(event.target).find($("")).css("color", "green");
    });
  });
});
