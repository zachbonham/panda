module Panda


  class SolutionRepository
    
    NAME = 1
    RELATIVE_PATH = 2
    ID = 3
    
    attr_accessor :solution_path
    
    def initialize(filename)
    
      raise "file not found: " + filename unless File.exist? filename
      @solution_path = filename
      
    end
    
    def all
    
      get_projects(@solution_path)
    
    end
    

    # TODO - add find_by as needed?
    #
    
    private
    
    def get_projects(filename)

      projects = []

      contents = read_file(filename)

      contents.scan(/^Project\(.*/) { |line| 
          tokens = line.split(/,|=/)
          projects << ProjectItem.new(
            tokens[ID], 
            tokens[NAME], 
            tokens[RELATIVE_PATH])
        }

      return projects

    end

    def read_file(filename)

      data = ''
      file = File.open(filename, 'r')
      file.each_line do |line|
        data += line
      end

      data
    end


  end
end
