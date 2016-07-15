class Model < ActiveRecord::Base

  def self.create_by_json(models_json, make)
    list = []
    Model.transaction do
      models_json.each do |json|
        if not Model.exists?(name: json["Nome"], make_id: make.id)
          list << {make_id: make.id, name: json["Nome"]}
        end
      end
    Model.create(list)
  end
  end

end
