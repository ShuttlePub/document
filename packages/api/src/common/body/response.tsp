import "../main.tsp";

namespace Common.Body;

model ArrayLimitedResponse<Item, Cursor = Common.Types.Nanoid> {
  first: Cursor;
  last: Cursor;
  items: Item[];
}
