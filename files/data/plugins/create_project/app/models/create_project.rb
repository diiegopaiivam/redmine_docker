class CreateProject < ActiveRecord::Base
    require "uri"
    require "json"
    require "net/http"
    
    BASE_URL = 'http://129.146.125.163:3030/'
    
    #Maximum length for project identifiers
    IDENTIFIER_MAX_LENGTH = 100

    validates_presence_of :name, :identifier, :description
    
    def identifier_frozen?
        errors[:identifier].blank? && !(new_record? || identifier.blank?)
    end


    def save_project(params)
        puts params
        url = URI("#{BASE_URL}/api/v1/projects")
        
        http = Net::HTTP.new(url.host, url.port);
        request = Net::HTTP::Post.new(url)
        request["Content-Type"] = "application/json"
        request.body = JSON.dump({
          "name": params["name"],
          "identifier": params["identifier"],
          "description": params["description"],
          "is_public": params["is_public"],
          "inherit_members": params["inherit_members"]
        })
        
        response = http.request(request)
        puts response.read_body
        
    end 
end
