class CreateProject < ActiveRecord::Base
    require "uri"
    require "json"
    require "net/http"
    
    BASE_URL = 'https://servicodados.ibge.gov.br/api/v1/localidades/distritos'
    API_KEY = '268d19f6fe2aeadc9f2d2ece95d566bd3f0e605c'
    #Maximum length for project identifiers
    IDENTIFIER_MAX_LENGTH = 100

    def identifier_frozen?
        errors[:identifier].blank? && !(new_record? || identifier.blank?)
    end


    def save_project(params)
        url = URI("#{BASE_URL}/1")

        http = Net::HTTP.new(url.host, url.port);
        
        request = Net::HTTP::Get.new(url)
        request["X-Redmine-API-Key"] = "3a88219d6dd3a26962052185748760e78d4ca653"
        
        response = http.request(request)
        puts response.read_body
    end 
end
