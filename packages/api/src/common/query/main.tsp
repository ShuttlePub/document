import "../main.tsp";
import "@typespec/http";

using TypeSpec.Http;

namespace Query;

model ArrayLimitQueries<
  Max extends valueof numeric = 100,
  DefaultLimit extends valueof numeric = 30,
  Cursor = Common.ULID
> {
  @maxValue(Max)
  @minValue(1)
  @query
  @doc("Default: ${DefaultLimit}")
  limit?: integer;

  @query
  cursor?: Cursor;

  @doc("Direction of the cursor")
  @query
  direction?: "next" | "prev" = "next";
}

model OrderedCollectionQueries {
  @query
  page?: boolean;

  @query
  since_id?: string;

  @query
  until_id?: string;
}
