require "suggest/version"

module Suggest
  def suggest params
    column_types = self.column_types.values.map(&:type)
    column_names = self.column_names
    columns = column_names.zip(column_types).to_h
    where_clauses = []
    params.each do |key, value|
      next if !columns.keys.include? key
      where_clauses << comp_exp(value,columns[key],key)
    end
    where_query = where_clauses.join(' AND ')
    where(where_query)
  end

  private

  def comp_exp value, type, name
    case type.to_s
    when 'string'
      comp_exp_str(value, name)
    when 'integer'
      comp_exp_num(value, name)
    when 'float'
      comp_exp_num(value, name)
    else
      ""
    end
  end

  def comp_exp_str value, name
    "name ilike '%#{value.downcase.gsub(/[\s,]+/,'%')}%'"
  end

  def comp_exp_num value, name
    if /^[^\d]{1,2}/.match(value).nil?
      "name = #{value}"
    else
      "name #{value}"
    end
  end
end
