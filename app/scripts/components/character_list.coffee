CharacterListItem = require("./character_list_item.coffee")
Fluxxor = require("fluxxor")

CharacterList = React.createClass
  mixins: [Fluxxor.FluxMixin(React), Fluxxor.StoreWatchMixin("characters")]

  componentDidMount: ->
    @getFlux().actions.characters.fetch()

  getStateFromFlux: ->
    store = @getFlux().store("characters")

    characters: store.getCharacters()
    loading: store.loading
    error: store.error

  render: ->
    <div>
      <Router.Link to="createCharacter">Create character</Router.Link>
      <ul>
        {@state.characters.map (character, i) ->
          <CharacterListItem character={character} key={i}/>
        }
      </ul>
    </div>

module.exports = CharacterList
