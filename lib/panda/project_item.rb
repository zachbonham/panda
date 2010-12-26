

module Panda

  class ProjectItem
    attr_accessor :projectId, :name, :relativePath

    def initialize(projectId, name, relativePath)
      @projectId = projectId
      @name = name
      @relativePath = relativePath
    end
  end

end