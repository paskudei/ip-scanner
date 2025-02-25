# frozen_string_literal: true

module GraphqlUtilityHelpers
  private

  def find(relation, id)
    scoped(relation).find(id)
  rescue ActiveRecord::RecordNotFound
    raise_not_found!(relation, id: id)
  end

  def find_by!(relation, conditions)
    scoped(relation).find_by(conditions) || raise_not_found!(relation, conditions)
  end

  def find_all(relation, conditions)
    scoped(relation).where(conditions)
  end

  def raise_not_found!(relation, query)
    raise GraphQL::ExecutionError.new(
      'Not found',
      extensions: {
        type: 'NOT_FOUND',
        relation: relation.class.to_s.gsub(/::.*/, ''),
        query: query
      }
    )
  end

  def scoped(relation)
    relation
  end
end
