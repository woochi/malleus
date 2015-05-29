Router = require("react-router")
Wizard = require("./wizard.coffee")
WizardStep = require("./wizard_step.coffee")
HomeworldSelector = require("./homeworld_selector.coffee")
BackgroundSelector = require("./background_selector.coffee")
RoleSelector = require("./role_selector.coffee")
SkillsAndTalents = require("./skills_talents.coffee")

CharacterCreator = React.createClass
  mixins: [Router.Navigation]
  displayName: "CharacterCreator"

  # TODO: Load all character creation data

  render: ->
    <Wizard>
      <WizardStep title="Select Homeworld"><HomeworldSelector/></WizardStep>
      <WizardStep title="Select Background"><BackgroundSelector/></WizardStep>
      <WizardStep title="Select Role"><RoleSelector/></WizardStep>
      <WizardStep title="Skills & Talents"><SkillsAndTalents/></WizardStep>
    </Wizard>

  close: ->
    @transitionTo("characters")

module.exports = CharacterCreator
