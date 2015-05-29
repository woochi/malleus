API =

  url: (path) ->
    "http://localhost:5920" + path

  get: (path) ->
    $.get @url(path)

  post: (path) ->
    $.post @url(path), path

module.exports = API
