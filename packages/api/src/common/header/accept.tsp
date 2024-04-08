import "@typespec/http";

using TypeSpec.Http;

namespace Common.Header.Accept {
  model Accept<T> {
    @header
    accept: T;
  }
  model ActivityJson is Accept<"application/activity+json">;
}
