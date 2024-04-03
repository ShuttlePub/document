import "@typespec/http";

using TypeSpec.Http;

namespace Query;

model ArrayLimitQueries<
  Max extends valueof numeric = 100,
  DefaultLimit extends valueof numeric = 30
> {
  @maxValue(Max)
  @minValue(1)
  @query
  @doc("Default: ${DefaultLimit}")
  limit?: integer;

  @minValue(0)
  @query
  offset?: integer = 0;
}

model OrderedCollectionQueries {
  @query
  page?: boolean;

  @query
  since_id?: string;

  @query
  until_id?: string;
}
