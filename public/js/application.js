$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('search_tag_box. submit').click(function(event){
    event.preventDefault();
    alert("working")
    // $.ajax({
    //   method: "POST",
    //   url: '/questions/tag'
    // }).done(function(response) {
    //   alert("working!!!");
    // }),
  });
});
