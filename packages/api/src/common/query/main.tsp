import "@typespec/http";

using TypeSpec.Http;

namespace Query;

model ArrayLimitQueries<Max extends valueof numeric = 100> {
  @maxValue(Max)
  @minValue(1)
  @query
  limit?: integer = 30;

  @minValue(0)
  @query
  offset?: integer = 0;
}
