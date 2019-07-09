$(document).ready ->

button = $ ".button"
dropdown = $ ".dropdown"

$("button").click -> dropdown.classList.toggle('is-open');
