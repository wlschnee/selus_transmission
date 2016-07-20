$(document).on('turbolinks:load', function() {
  $('.post-delete').click(function(event){
    event.preventDefault()
    if(!confirm('Are you sure you want to delete this post?')) {
      return false;
    }
  })
})

