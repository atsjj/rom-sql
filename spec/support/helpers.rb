module Helpers
  def qualified_attribute(*args)
    ROM::SQL::QualifiedAttribute[*args]
  end

  def assoc_name(*args)
    ROM::SQL::Association::Name[*args]
  end

  def define_schema(name, attrs)
    ROM::SQL::Schema.define(
      name,
      attributes: attrs.map { |key, value| value.meta(name: key, source: ROM::Relation::Name.new(name)) },
      type_class: ROM::SQL::Type
    )
  end

  def define_type(name, id, **opts)
    ROM::SQL::Type.new(ROM::Types.const_get(id).meta(name: name, **opts))
  end
end
