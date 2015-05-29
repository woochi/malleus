React = window.React = require("react/addons")
Router = window.Router = require("react-router")
Route = Router.Route
mountNode = document.getElementById("app")

index = require("index")
CharacterList = require("components/character_list")
CharacterCreator = require("components/character_creator")
BattleManager = require("components/battle_manager")

App = React.createClass
  displayName: "App"

  render: ->
    <Router.RouteHandler {...@props}/>

routes =
  <Route handler={App}>
    <Route name="characters" handler={CharacterList}/>
    <Router.Route name="createCharacter" path="/characters/new" handler={CharacterCreator}/>
    <Router.Route name="battle" handler={BattleManager}/>
  </Route>

fetchData = (routes, params) ->
  next = new $.Deferred()
  data = {}
  dataRequests = routes
    .filter((route) -> route.handler.fetchData)
    .map((route) -> route.handler.fetchData(params).then((d) -> data[route.name] = d))
  $.when.apply($, dataRequests).then ->
    console.log dataRequests, data
    next.resolve(data)
  next.promise()

Router.run routes, Router.HistoryLocation, (Handler, state) ->
  fetchData(state.routes, state.params).then (data, meh) ->
    React.render <Handler/>, mountNode
