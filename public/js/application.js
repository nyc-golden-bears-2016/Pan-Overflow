$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.upvote_form').on("submit", function(event){
    event.preventDefault();
    var request = $.ajax({
      method: "POST",
      url: "/votes",
      data: $(event.target.children).each(function(index, el) {el.name; el.value})
    });
    request.done(function(response){
      if ( $(event.target.children).val() == "false" ) {
        alert("You have to be logged in to do that");
      }
      else {
        var currentVote = $(event.target).parent().parent().siblings().find("#vote-count").html();
        var newVote = parseInt(currentVote) + 1;
        $(event.target).parent().parent().siblings().find("#vote-count").html(newVote);
        }
      });
    // it doesnt fail, if it fails it would return this
    request.fail(function(jqXHR, textStatus){
        alert("You can only vote once");
      });
    });

  $('.downvote_form').on("submit", function(event){
    event.preventDefault();
    var request = $.ajax({
      method: "POST",
      url: "/votes",
      data: $(event.target.children).each(function(index, el) {el.name; el.value})
    });
    request.done(function(response){
        if ( $(event.target.children).val() == "false" ) {
        alert("You have to be logged in to do that");
      }
      else {
        var currentVote = $(event.target).parent().parent().siblings().find("#vote-count").html();
        var newVote = parseInt(currentVote) - 1;
        $(event.target).parent().parent().siblings().find("#vote-count").html(newVote);
        }
      });
    });
});
