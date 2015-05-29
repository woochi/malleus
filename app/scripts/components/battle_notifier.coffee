NotificationStore = require("stores/notification_store")

BattleNotifier = React.createClass

  componentDidMount: ->
    NotificationStore.listen(@update)

  componentWillUnmount: ->
    NotificationStore.unlisten(@update)

  render: ->
    console.log "NOTIF", NotificationStore.getState()
    <div className="battle-notifier">
      {NotificationStore.getState().message}
    </div>

  update: ->
    @forceUpdate()

module.exports = BattleNotifier
