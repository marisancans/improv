#= require action_cable
#= require_self
#= require_tree ./channels
(->
  @App or (@App = {})
  App.cable = ActionCable.createConsumer()
  return
).call this