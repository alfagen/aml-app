module SimpleForm
  module Inputs
    class Base
      def translate_from_namespace(namespace)
        return if [:placeholders, :hints].include?(namespace)
        lookups = []
        lookups << :"#{lookup_model_names.first}.#{reflection_or_attribute_name}"
        I18n.t(lookups.shift, scope: 'activerecord.attributes').presence
      end
    end
  end
end
