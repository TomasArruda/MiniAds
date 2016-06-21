
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


function add_fields(link, association, content) {
    event.preventDefault()
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
}