import "../main.tsp";

namespace Common.Body;

model ArrayLimitedResponse<Item, Cursor = Common.ULID> {
  first: Cursor;
  last: Cursor;
  items: Item[];
}
