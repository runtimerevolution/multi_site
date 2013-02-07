module Contests
  module QuestionnairesHelper
    def link_to_remove_field(name, f)
      f.hidden_field(:_destroy) +
      link_to_function(raw(name), "removeField(this)", :id =>"remove-attach")
    end

    def new_questionnaire_path
      new_contests_questionnaire_path
    end

    def edit_questionnaire_path(resource)
      edit_contests_questionnaire_path(resource)
    end

    def questionnaire_scope(resource)
       [:contests, resource]
    end

    def link_to_add_field(name, f, association)
      new_object = f.object.class.reflect_on_association(association).klass.new
      fields = f.fields_for(association, new_object,:child_index => "new_#{association}") do |builder|
        render(association.to_s.singularize + "_fields", :f => builder)
      end
      link_to_function(name, "addField(this, \"#{association}\", \"#{escape_javascript(fields)}\")",
      :id=>"add-attach",
      :class=>"btn btn-small btn-info")
    end
  end
end