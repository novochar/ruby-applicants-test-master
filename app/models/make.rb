class Make < ActiveRecord::Base

  def self.create_by_json(json)
    list = []
    Make.transaction do
      json.each do |make_params|
        if not Make.exists?(name: make_params["Nome"]) 
          list << {name: make_params["Nome"], webmotors_id: make_params["Id"]}
        end
      end
      Make.create(list)
    end
  end

end
