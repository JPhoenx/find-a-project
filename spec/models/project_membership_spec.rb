require "rails_helper"

describe ProjectMembership do

  it "has association to a Project" do
    project = Project.create!({
      description: "working on iOS"
    })
    member = ProjectMembership.create!({
      user_name: "Eric",
      project_id: project.id
    })
    expect(member.user_name).to eq("Eric")
    expect(member.project).to eq(project)
  end

  it "can be found by Project" do
    project = Project.create!({
      description: "working on iOS"
    })
    ["Justin", "Eric"].each do |name|
      ProjectMembership.create!({
        user_name: name,
        project_id: project.id
      })
    end
    expect(project.project_memberships.count).to eq(2)
  end

end

