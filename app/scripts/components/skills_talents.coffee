Skill = require("./skill.coffee")
SkillGroup = require("./skill_group.coffee")
SkillEditor = require("./skill_editor.coffee")
TalentEditor = require("./talent_editor.coffee")
skills = require("../data/skills.coffee")
Tabs = require("./tabs.coffee")
Tab = require("./tab.coffee")

SkillsAndTalents = React.createClass

  render: ->
    <div className="editor">
      <div className="editor-content">
        <ul className="skill-list">
          {skills.map (skill) -> <Skill {...skill}/>}
        </ul>
      </div>
      <Tabs>
        <Tab key={1} name="Skills"><SkillEditor/></Tab>
        <Tab key={2} name="Talents"><TalentEditor/></Tab>
      </Tabs>
    </div>

module.exports = SkillsAndTalents
