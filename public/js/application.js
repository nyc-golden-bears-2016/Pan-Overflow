$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.upvote_form').on("submit", function(event){
    event.preventDefault();
    $.ajax({
      method: "POST",
      url: "/votes",
      data: $(event.target.children).each(function(index, el) {el.name; el.value})
    }).done(function(response){

var currentVote = $(event.target).parent().parent().siblings().find("#vote-count").html();
var newVote = parseInt(currentVote) + 1;
$(event.target).parent().parent().siblings().find("#vote-count").html(newVote);

    });
  });

  $('.downvote_form').on("submit", function(event){
    event.preventDefault();
    $.ajax({
      method: "POST",
      url: "/votes",
      data: $(event.target.children).each(function(index, el) {el.name; el.value})
    }).done(function(response){

var currentVote = $(event.target).parent().parent().siblings().find("#vote-count").html();
var newVote = parseInt(currentVote) - 1;
$(event.target).parent().parent().siblings().find("#vote-count").html(newVote);

    });
  });


});
