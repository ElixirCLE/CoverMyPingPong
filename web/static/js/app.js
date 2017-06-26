// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"

document.querySelector('input[list]').addEventListener('input', function(e) {
  var input = e.target,
    list = input.getAttribute('list'),
    options = document.querySelectorAll('#' + list + ' option'),
    hiddenInput = document.getElementById(input.getAttribute('id') + '-hidden'),
    label = input.value;

  hiddenInput.value = label;
  console.log(hiddenInput.value);

  for(var i = 0; i < options.length; i++) {
    var option = options[i];

    if(option.innerText === label) {
      hiddenInput.value = option.getAttribute('data-value');
      break;
    }
  }
})
document.querySelector('#game_opponent_id').addEventListener('input', function(e) {
  var input = e.target,
    list = input.getAttribute('list'),
    options = document.querySelectorAll('#' + list + ' option'),
    hiddenInput = document.getElementById(input.getAttribute('id') + '-hidden'),
    label = input.value;

  hiddenInput.value = label;
  console.log(hiddenInput.value);

  for(var i = 0; i < options.length; i++) {
    var option = options[i];

    if(option.innerText === label) {
      hiddenInput.value = option.getAttribute('data-value');
      break;
    }
  }
})
document.querySelector('#game_match_winner_id').addEventListener('input', function(e) {
  var input = e.target,
    list = input.getAttribute('list'),
    options = document.querySelectorAll('#' + list + ' option'),
    hiddenInput = document.getElementById(input.getAttribute('id') + '-hidden'),
    label = input.value;

  hiddenInput.value = label;
  console.log(hiddenInput.value);

  for(var i = 0; i < options.length; i++) {
    var option = options[i];

    if(option.innerText === label) {
      hiddenInput.value = option.getAttribute('data-value');
      break;
    }
  }
})
